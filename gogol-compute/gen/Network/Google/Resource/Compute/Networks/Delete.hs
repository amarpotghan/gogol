{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Compute.Networks.Delete
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Deletes the specified network resource.
--
-- /See:/ <https://developers.google.com/compute/docs/reference/latest/ Compute Engine API Reference> for @ComputeNetworksDelete@.
module Compute.Networks.Delete
    (
    -- * REST Resource
      NetworksDeleteAPI

    -- * Creating a Request
    , networksDelete
    , NetworksDelete

    -- * Request Lenses
    , ndQuotaUser
    , ndPrettyPrint
    , ndProject
    , ndUserIp
    , ndNetwork
    , ndKey
    , ndOauthToken
    , ndFields
    , ndAlt
    ) where

import           Network.Google.Compute.Types
import           Network.Google.Prelude

-- | A resource alias for @ComputeNetworksDelete@ which the
-- 'NetworksDelete' request conforms to.
type NetworksDeleteAPI =
     Capture "project" Text :>
       "global" :>
         "networks" :>
           Capture "network" Text :> Delete '[JSON] Operation

-- | Deletes the specified network resource.
--
-- /See:/ 'networksDelete' smart constructor.
data NetworksDelete = NetworksDelete
    { _ndQuotaUser   :: !(Maybe Text)
    , _ndPrettyPrint :: !Bool
    , _ndProject     :: !Text
    , _ndUserIp      :: !(Maybe Text)
    , _ndNetwork     :: !Text
    , _ndKey         :: !(Maybe Text)
    , _ndOauthToken  :: !(Maybe Text)
    , _ndFields      :: !(Maybe Text)
    , _ndAlt         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'NetworksDelete'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ndQuotaUser'
--
-- * 'ndPrettyPrint'
--
-- * 'ndProject'
--
-- * 'ndUserIp'
--
-- * 'ndNetwork'
--
-- * 'ndKey'
--
-- * 'ndOauthToken'
--
-- * 'ndFields'
--
-- * 'ndAlt'
networksDelete
    :: Text -- ^ 'project'
    -> Text -- ^ 'network'
    -> NetworksDelete
networksDelete pNdProject_ pNdNetwork_ =
    NetworksDelete
    { _ndQuotaUser = Nothing
    , _ndPrettyPrint = True
    , _ndProject = pNdProject_
    , _ndUserIp = Nothing
    , _ndNetwork = pNdNetwork_
    , _ndKey = Nothing
    , _ndOauthToken = Nothing
    , _ndFields = Nothing
    , _ndAlt = "json"
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
ndQuotaUser :: Lens' NetworksDelete' (Maybe Text)
ndQuotaUser
  = lens _ndQuotaUser (\ s a -> s{_ndQuotaUser = a})

-- | Returns response with indentations and line breaks.
ndPrettyPrint :: Lens' NetworksDelete' Bool
ndPrettyPrint
  = lens _ndPrettyPrint
      (\ s a -> s{_ndPrettyPrint = a})

-- | Project ID for this request.
ndProject :: Lens' NetworksDelete' Text
ndProject
  = lens _ndProject (\ s a -> s{_ndProject = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
ndUserIp :: Lens' NetworksDelete' (Maybe Text)
ndUserIp = lens _ndUserIp (\ s a -> s{_ndUserIp = a})

-- | Name of the network resource to delete.
ndNetwork :: Lens' NetworksDelete' Text
ndNetwork
  = lens _ndNetwork (\ s a -> s{_ndNetwork = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
ndKey :: Lens' NetworksDelete' (Maybe Text)
ndKey = lens _ndKey (\ s a -> s{_ndKey = a})

-- | OAuth 2.0 token for the current user.
ndOauthToken :: Lens' NetworksDelete' (Maybe Text)
ndOauthToken
  = lens _ndOauthToken (\ s a -> s{_ndOauthToken = a})

-- | Selector specifying which fields to include in a partial response.
ndFields :: Lens' NetworksDelete' (Maybe Text)
ndFields = lens _ndFields (\ s a -> s{_ndFields = a})

-- | Data format for the response.
ndAlt :: Lens' NetworksDelete' Text
ndAlt = lens _ndAlt (\ s a -> s{_ndAlt = a})

instance GoogleRequest NetworksDelete' where
        type Rs NetworksDelete' = Operation
        request = requestWithRoute defReq computeURL
        requestWithRoute r u NetworksDelete{..}
          = go _ndQuotaUser _ndPrettyPrint _ndProject _ndUserIp
              _ndNetwork
              _ndKey
              _ndOauthToken
              _ndFields
              _ndAlt
          where go
                  = clientWithRoute (Proxy :: Proxy NetworksDeleteAPI)
                      r
                      u