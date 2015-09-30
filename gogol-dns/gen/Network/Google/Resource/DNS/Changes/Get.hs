{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.DNS.Changes.Get
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Fetch the representation of an existing Change.
--
-- /See:/ <https://developers.google.com/cloud-dns Google Cloud DNS API Reference> for @DNSChangesGet@.
module DNS.Changes.Get
    (
    -- * REST Resource
      ChangesGetAPI

    -- * Creating a Request
    , changesGet
    , ChangesGet

    -- * Request Lenses
    , cgQuotaUser
    , cgPrettyPrint
    , cgProject
    , cgUserIp
    , cgChangeId
    , cgKey
    , cgOauthToken
    , cgManagedZone
    , cgFields
    , cgAlt
    ) where

import           Network.Google.DNS.Types
import           Network.Google.Prelude

-- | A resource alias for @DNSChangesGet@ which the
-- 'ChangesGet' request conforms to.
type ChangesGetAPI =
     Capture "project" Text :>
       "managedZones" :>
         Capture "managedZone" Text :>
           "changes" :>
             Capture "changeId" Text :> Get '[JSON] Change

-- | Fetch the representation of an existing Change.
--
-- /See:/ 'changesGet' smart constructor.
data ChangesGet = ChangesGet
    { _cgQuotaUser   :: !(Maybe Text)
    , _cgPrettyPrint :: !Bool
    , _cgProject     :: !Text
    , _cgUserIp      :: !(Maybe Text)
    , _cgChangeId    :: !Text
    , _cgKey         :: !(Maybe Text)
    , _cgOauthToken  :: !(Maybe Text)
    , _cgManagedZone :: !Text
    , _cgFields      :: !(Maybe Text)
    , _cgAlt         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ChangesGet'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cgQuotaUser'
--
-- * 'cgPrettyPrint'
--
-- * 'cgProject'
--
-- * 'cgUserIp'
--
-- * 'cgChangeId'
--
-- * 'cgKey'
--
-- * 'cgOauthToken'
--
-- * 'cgManagedZone'
--
-- * 'cgFields'
--
-- * 'cgAlt'
changesGet
    :: Text -- ^ 'project'
    -> Text -- ^ 'changeId'
    -> Text -- ^ 'managedZone'
    -> ChangesGet
changesGet pCgProject_ pCgChangeId_ pCgManagedZone_ =
    ChangesGet
    { _cgQuotaUser = Nothing
    , _cgPrettyPrint = True
    , _cgProject = pCgProject_
    , _cgUserIp = Nothing
    , _cgChangeId = pCgChangeId_
    , _cgKey = Nothing
    , _cgOauthToken = Nothing
    , _cgManagedZone = pCgManagedZone_
    , _cgFields = Nothing
    , _cgAlt = "json"
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
cgQuotaUser :: Lens' ChangesGet' (Maybe Text)
cgQuotaUser
  = lens _cgQuotaUser (\ s a -> s{_cgQuotaUser = a})

-- | Returns response with indentations and line breaks.
cgPrettyPrint :: Lens' ChangesGet' Bool
cgPrettyPrint
  = lens _cgPrettyPrint
      (\ s a -> s{_cgPrettyPrint = a})

-- | Identifies the project addressed by this request.
cgProject :: Lens' ChangesGet' Text
cgProject
  = lens _cgProject (\ s a -> s{_cgProject = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
cgUserIp :: Lens' ChangesGet' (Maybe Text)
cgUserIp = lens _cgUserIp (\ s a -> s{_cgUserIp = a})

-- | The identifier of the requested change, from a previous
-- ResourceRecordSetsChangeResponse.
cgChangeId :: Lens' ChangesGet' Text
cgChangeId
  = lens _cgChangeId (\ s a -> s{_cgChangeId = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
cgKey :: Lens' ChangesGet' (Maybe Text)
cgKey = lens _cgKey (\ s a -> s{_cgKey = a})

-- | OAuth 2.0 token for the current user.
cgOauthToken :: Lens' ChangesGet' (Maybe Text)
cgOauthToken
  = lens _cgOauthToken (\ s a -> s{_cgOauthToken = a})

-- | Identifies the managed zone addressed by this request. Can be the
-- managed zone name or id.
cgManagedZone :: Lens' ChangesGet' Text
cgManagedZone
  = lens _cgManagedZone
      (\ s a -> s{_cgManagedZone = a})

-- | Selector specifying which fields to include in a partial response.
cgFields :: Lens' ChangesGet' (Maybe Text)
cgFields = lens _cgFields (\ s a -> s{_cgFields = a})

-- | Data format for the response.
cgAlt :: Lens' ChangesGet' Text
cgAlt = lens _cgAlt (\ s a -> s{_cgAlt = a})

instance GoogleRequest ChangesGet' where
        type Rs ChangesGet' = Change
        request = requestWithRoute defReq dNSURL
        requestWithRoute r u ChangesGet{..}
          = go _cgQuotaUser _cgPrettyPrint _cgProject _cgUserIp
              _cgChangeId
              _cgKey
              _cgOauthToken
              _cgManagedZone
              _cgFields
              _cgAlt
          where go
                  = clientWithRoute (Proxy :: Proxy ChangesGetAPI) r u