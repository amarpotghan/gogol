{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.YouTube.ChannelSections.List
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Returns channelSection resources that match the API request criteria.
--
-- /See:/ <https://developers.google.com/youtube/v3 YouTube Data API Reference> for @YouTubeChannelSectionsList@.
module YouTube.ChannelSections.List
    (
    -- * REST Resource
      ChannelSectionsListAPI

    -- * Creating a Request
    , channelSectionsList
    , ChannelSectionsList

    -- * Request Lenses
    , cslQuotaUser
    , cslPart
    , cslPrettyPrint
    , cslMine
    , cslUserIp
    , cslChannelId
    , cslHl
    , cslOnBehalfOfContentOwner
    , cslKey
    , cslId
    , cslOauthToken
    , cslFields
    , cslAlt
    ) where

import           Network.Google.Prelude
import           Network.Google.YouTube.Types

-- | A resource alias for @YouTubeChannelSectionsList@ which the
-- 'ChannelSectionsList' request conforms to.
type ChannelSectionsListAPI =
     "channelSections" :>
       QueryParam "part" Text :>
         QueryParam "mine" Bool :>
           QueryParam "channelId" Text :>
             QueryParam "hl" Text :>
               QueryParam "onBehalfOfContentOwner" Text :>
                 QueryParam "id" Text :>
                   Get '[JSON] ChannelSectionListResponse

-- | Returns channelSection resources that match the API request criteria.
--
-- /See:/ 'channelSectionsList' smart constructor.
data ChannelSectionsList = ChannelSectionsList
    { _cslQuotaUser              :: !(Maybe Text)
    , _cslPart                   :: !Text
    , _cslPrettyPrint            :: !Bool
    , _cslMine                   :: !(Maybe Bool)
    , _cslUserIp                 :: !(Maybe Text)
    , _cslChannelId              :: !(Maybe Text)
    , _cslHl                     :: !(Maybe Text)
    , _cslOnBehalfOfContentOwner :: !(Maybe Text)
    , _cslKey                    :: !(Maybe Text)
    , _cslId                     :: !(Maybe Text)
    , _cslOauthToken             :: !(Maybe Text)
    , _cslFields                 :: !(Maybe Text)
    , _cslAlt                    :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ChannelSectionsList'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cslQuotaUser'
--
-- * 'cslPart'
--
-- * 'cslPrettyPrint'
--
-- * 'cslMine'
--
-- * 'cslUserIp'
--
-- * 'cslChannelId'
--
-- * 'cslHl'
--
-- * 'cslOnBehalfOfContentOwner'
--
-- * 'cslKey'
--
-- * 'cslId'
--
-- * 'cslOauthToken'
--
-- * 'cslFields'
--
-- * 'cslAlt'
channelSectionsList
    :: Text -- ^ 'part'
    -> ChannelSectionsList
channelSectionsList pCslPart_ =
    ChannelSectionsList
    { _cslQuotaUser = Nothing
    , _cslPart = pCslPart_
    , _cslPrettyPrint = True
    , _cslMine = Nothing
    , _cslUserIp = Nothing
    , _cslChannelId = Nothing
    , _cslHl = Nothing
    , _cslOnBehalfOfContentOwner = Nothing
    , _cslKey = Nothing
    , _cslId = Nothing
    , _cslOauthToken = Nothing
    , _cslFields = Nothing
    , _cslAlt = "json"
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
cslQuotaUser :: Lens' ChannelSectionsList' (Maybe Text)
cslQuotaUser
  = lens _cslQuotaUser (\ s a -> s{_cslQuotaUser = a})

-- | The part parameter specifies a comma-separated list of one or more
-- channelSection resource properties that the API response will include.
-- The part names that you can include in the parameter value are id,
-- snippet, and contentDetails. If the parameter identifies a property that
-- contains child properties, the child properties will be included in the
-- response. For example, in a channelSection resource, the snippet
-- property contains other properties, such as a display title for the
-- channelSection. If you set part=snippet, the API response will also
-- contain all of those nested properties.
cslPart :: Lens' ChannelSectionsList' Text
cslPart = lens _cslPart (\ s a -> s{_cslPart = a})

-- | Returns response with indentations and line breaks.
cslPrettyPrint :: Lens' ChannelSectionsList' Bool
cslPrettyPrint
  = lens _cslPrettyPrint
      (\ s a -> s{_cslPrettyPrint = a})

-- | Set this parameter\'s value to true to retrieve a feed of the
-- authenticated user\'s channelSections.
cslMine :: Lens' ChannelSectionsList' (Maybe Bool)
cslMine = lens _cslMine (\ s a -> s{_cslMine = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
cslUserIp :: Lens' ChannelSectionsList' (Maybe Text)
cslUserIp
  = lens _cslUserIp (\ s a -> s{_cslUserIp = a})

-- | The channelId parameter specifies a YouTube channel ID. The API will
-- only return that channel\'s channelSections.
cslChannelId :: Lens' ChannelSectionsList' (Maybe Text)
cslChannelId
  = lens _cslChannelId (\ s a -> s{_cslChannelId = a})

-- | The hl parameter indicates that the snippet.localized property values in
-- the returned channelSection resources should be in the specified
-- language if localized values for that language are available. For
-- example, if the API request specifies hl=de, the snippet.localized
-- properties in the API response will contain German titles if German
-- titles are available. Channel owners can provide localized channel
-- section titles using either the channelSections.insert or
-- channelSections.update method.
cslHl :: Lens' ChannelSectionsList' (Maybe Text)
cslHl = lens _cslHl (\ s a -> s{_cslHl = a})

-- | Note: This parameter is intended exclusively for YouTube content
-- partners. The onBehalfOfContentOwner parameter indicates that the
-- request\'s authorization credentials identify a YouTube CMS user who is
-- acting on behalf of the content owner specified in the parameter value.
-- This parameter is intended for YouTube content partners that own and
-- manage many different YouTube channels. It allows content owners to
-- authenticate once and get access to all their video and channel data,
-- without having to provide authentication credentials for each individual
-- channel. The CMS account that the user authenticates with must be linked
-- to the specified YouTube content owner.
cslOnBehalfOfContentOwner :: Lens' ChannelSectionsList' (Maybe Text)
cslOnBehalfOfContentOwner
  = lens _cslOnBehalfOfContentOwner
      (\ s a -> s{_cslOnBehalfOfContentOwner = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
cslKey :: Lens' ChannelSectionsList' (Maybe Text)
cslKey = lens _cslKey (\ s a -> s{_cslKey = a})

-- | The id parameter specifies a comma-separated list of the YouTube
-- channelSection ID(s) for the resource(s) that are being retrieved. In a
-- channelSection resource, the id property specifies the YouTube
-- channelSection ID.
cslId :: Lens' ChannelSectionsList' (Maybe Text)
cslId = lens _cslId (\ s a -> s{_cslId = a})

-- | OAuth 2.0 token for the current user.
cslOauthToken :: Lens' ChannelSectionsList' (Maybe Text)
cslOauthToken
  = lens _cslOauthToken
      (\ s a -> s{_cslOauthToken = a})

-- | Selector specifying which fields to include in a partial response.
cslFields :: Lens' ChannelSectionsList' (Maybe Text)
cslFields
  = lens _cslFields (\ s a -> s{_cslFields = a})

-- | Data format for the response.
cslAlt :: Lens' ChannelSectionsList' Text
cslAlt = lens _cslAlt (\ s a -> s{_cslAlt = a})

instance GoogleRequest ChannelSectionsList' where
        type Rs ChannelSectionsList' =
             ChannelSectionListResponse
        request = requestWithRoute defReq youTubeURL
        requestWithRoute r u ChannelSectionsList{..}
          = go _cslQuotaUser (Just _cslPart) _cslPrettyPrint
              _cslMine
              _cslUserIp
              _cslChannelId
              _cslHl
              _cslOnBehalfOfContentOwner
              _cslKey
              _cslId
              _cslOauthToken
              _cslFields
              _cslAlt
          where go
                  = clientWithRoute
                      (Proxy :: Proxy ChannelSectionsListAPI)
                      r
                      u