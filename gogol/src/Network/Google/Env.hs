-- |
-- Module      : Network.Google.Env
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : provisional
-- Portability : non-portable (GHC extensions)
--
-- Environment and Google specific configuration for the 'Network.Google' monad.
module Network.Google.Env where

import           Control.Lens
import           Control.Monad.Catch
import           Control.Monad.IO.Class
import           Control.Monad.Reader
import           Data.Function          (on)
import           Data.Monoid
import           Network.Google.Auth
import           Network.Google.Types
import           Network.HTTP.Conduit

-- | The environment containing the parameters required to make Google requests.
data Env = Env
    { _envOverride :: !(Dual (Endo Service))
    , _envManager  :: !Manager
    , _envAuth     :: !Auth
    }

-- Note: The strictness annotations aobe are applied to ensure
-- total field initialisation.

class HasEnv a where
    environment :: Lens' a Env
    {-# MINIMAL environment #-}

    -- | The currently applied overrides to all 'Service' configuration.
    envOverride :: Lens' a (Dual (Endo Service))

    -- | The 'Manager' used to create and manage open HTTP connections.
    envManager  :: Lens' a Manager

    -- | The credentials used to sign requests for authentication with Google.
    envAuth     :: Lens' a Auth

    envOverride = environment . lens _envOverride (\s a -> s { _envOverride = a })
    envManager  = environment . lens _envManager  (\s a -> s { _envManager  = a })
    envAuth     = environment . lens _envAuth     (\s a -> s { _envAuth     = a })

instance HasEnv Env where
    environment = id

-- | Provide a function which will be added to the existing stack
-- of overrides applied to all service configuration.
--
-- To override a specific service, it's suggested you use
-- either 'configure' or 'reconfigure' with a modified version of the default
-- service, such as @Network.Google.Gmail.gmail@.
override :: HasEnv a => (Service -> Service) -> a -> a
override f = envOverride <>~ Dual (Endo f)

-- | Configure a specific service. All requests belonging to the
-- supplied service will use this configuration instead of the default.
--
-- It's suggested you use a modified version of the default service, such
-- as @Network.Google.Gmail.gmail@.
--
-- /See:/ 'reconfigure'.
configure :: HasEnv a => Service -> a -> a
configure s = override f
  where
    f x | on (==) _svcId s x = s
        | otherwise          = x

-- | Scope an action such that all requests belonging to the supplied service
-- will use this configuration instead of the default.
--
-- It's suggested you use a modified version of the default service, such
-- as @Network.Google.Gmail.gmail@.
--
-- /See:/ 'configure'.
reconfigure :: (MonadReader r m, HasEnv r) => Service -> m a -> m a
reconfigure = local . configure

-- | Scope an action such that any HTTP response will use this timeout value.
--
-- Default timeouts are chosen by considering:
--
-- * This 'timeout', if set.
--
-- * The related 'Service' timeout for the sent request if set. (Usually 70s)
--
-- * The 'envManager' timeout if set.
--
-- * The default 'ClientRequest' timeout. (Approximately 30s)
timeout :: (MonadReader r m, HasEnv r) => Seconds -> m a -> m a
timeout s = local (override (serviceTimeout ?~ s))

-- | Creates a new environment with a new 'Manager' without debug logging
-- and uses 'getAuth' to expand/discover the supplied 'Credentials'.
-- Lenses from 'HasEnv' can be used to further configure the resulting 'Env'.
--
-- /See:/ 'newEnvWith'.
newEnv :: (MonadIO m, MonadCatch m) => Credentials -> m Env
newEnv c = liftIO (newManager tlsManagerSettings) >>= newEnvWith c

-- | /See:/ 'newEnv'
newEnvWith :: (MonadIO m, MonadCatch m) => Credentials -> Manager -> m Env
newEnvWith c m = Env mempty m <$> getAuth m c