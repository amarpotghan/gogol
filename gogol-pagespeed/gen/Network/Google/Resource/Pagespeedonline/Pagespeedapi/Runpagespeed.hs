{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Pagespeedonline.Pagespeedapi.Runpagespeed
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Runs PageSpeed analysis on the page at the specified URL, and returns
-- PageSpeed scores, a list of suggestions to make that page faster, and
-- other information.
--
-- /See:/ <https://developers.google.com/speed/docs/insights/v2/getting-started PageSpeed Insights API Reference> for @PagespeedonlinePagespeedapiRunpagespeed@.
module Pagespeedonline.Pagespeedapi.Runpagespeed
    (
    -- * REST Resource
      PagespeedapiRunpagespeedAPI

    -- * Creating a Request
    , pagespeedapiRunpagespeed
    , PagespeedapiRunpagespeed

    -- * Request Lenses
    , prScreenshot
    , prQuotaUser
    , prPrettyPrint
    , prUserIp
    , prLocale
    , prUrl
    , prFilterThirdPartyResources
    , prStrategy
    , prRule
    , prKey
    , prOauthToken
    , prFields
    , prAlt
    ) where

import           Network.Google.PageSpeed.Types
import           Network.Google.Prelude

-- | A resource alias for @PagespeedonlinePagespeedapiRunpagespeed@ which the
-- 'PagespeedapiRunpagespeed' request conforms to.
type PagespeedapiRunpagespeedAPI =
     "runPagespeed" :>
       QueryParam "screenshot" Bool :>
         QueryParam "locale" Text :>
           QueryParam "url" Text :>
             QueryParam "filter_third_party_resources" Bool :>
               QueryParam "strategy" Text :>
                 QueryParams "rule" Text :> Get '[JSON] Result

-- | Runs PageSpeed analysis on the page at the specified URL, and returns
-- PageSpeed scores, a list of suggestions to make that page faster, and
-- other information.
--
-- /See:/ 'pagespeedapiRunpagespeed' smart constructor.
data PagespeedapiRunpagespeed = PagespeedapiRunpagespeed
    { _prScreenshot                :: !Bool
    , _prQuotaUser                 :: !(Maybe Text)
    , _prPrettyPrint               :: !Bool
    , _prUserIp                    :: !(Maybe Text)
    , _prLocale                    :: !(Maybe Text)
    , _prUrl                       :: !Text
    , _prFilterThirdPartyResources :: !Bool
    , _prStrategy                  :: !(Maybe Text)
    , _prRule                      :: !(Maybe Text)
    , _prKey                       :: !(Maybe Text)
    , _prOauthToken                :: !(Maybe Text)
    , _prFields                    :: !(Maybe Text)
    , _prAlt                       :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PagespeedapiRunpagespeed'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prScreenshot'
--
-- * 'prQuotaUser'
--
-- * 'prPrettyPrint'
--
-- * 'prUserIp'
--
-- * 'prLocale'
--
-- * 'prUrl'
--
-- * 'prFilterThirdPartyResources'
--
-- * 'prStrategy'
--
-- * 'prRule'
--
-- * 'prKey'
--
-- * 'prOauthToken'
--
-- * 'prFields'
--
-- * 'prAlt'
pagespeedapiRunpagespeed
    :: Text -- ^ 'url'
    -> PagespeedapiRunpagespeed
pagespeedapiRunpagespeed pPrUrl_ =
    PagespeedapiRunpagespeed
    { _prScreenshot = False
    , _prQuotaUser = Nothing
    , _prPrettyPrint = True
    , _prUserIp = Nothing
    , _prLocale = Nothing
    , _prUrl = pPrUrl_
    , _prFilterThirdPartyResources = False
    , _prStrategy = Nothing
    , _prRule = Nothing
    , _prKey = Nothing
    , _prOauthToken = Nothing
    , _prFields = Nothing
    , _prAlt = "json"
    }

-- | Indicates if binary data containing a screenshot should be included
prScreenshot :: Lens' PagespeedapiRunpagespeed' Bool
prScreenshot
  = lens _prScreenshot (\ s a -> s{_prScreenshot = a})

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
prQuotaUser :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prQuotaUser
  = lens _prQuotaUser (\ s a -> s{_prQuotaUser = a})

-- | Returns response with indentations and line breaks.
prPrettyPrint :: Lens' PagespeedapiRunpagespeed' Bool
prPrettyPrint
  = lens _prPrettyPrint
      (\ s a -> s{_prPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
prUserIp :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prUserIp = lens _prUserIp (\ s a -> s{_prUserIp = a})

-- | The locale used to localize formatted results
prLocale :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prLocale = lens _prLocale (\ s a -> s{_prLocale = a})

-- | The URL to fetch and analyze
prUrl :: Lens' PagespeedapiRunpagespeed' Text
prUrl = lens _prUrl (\ s a -> s{_prUrl = a})

-- | Indicates if third party resources should be filtered out before
-- PageSpeed analysis.
prFilterThirdPartyResources :: Lens' PagespeedapiRunpagespeed' Bool
prFilterThirdPartyResources
  = lens _prFilterThirdPartyResources
      (\ s a -> s{_prFilterThirdPartyResources = a})

-- | The analysis strategy to use
prStrategy :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prStrategy
  = lens _prStrategy (\ s a -> s{_prStrategy = a})

-- | A PageSpeed rule to run; if none are given, all rules are run
prRule :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prRule = lens _prRule (\ s a -> s{_prRule = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
prKey :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prKey = lens _prKey (\ s a -> s{_prKey = a})

-- | OAuth 2.0 token for the current user.
prOauthToken :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prOauthToken
  = lens _prOauthToken (\ s a -> s{_prOauthToken = a})

-- | Selector specifying which fields to include in a partial response.
prFields :: Lens' PagespeedapiRunpagespeed' (Maybe Text)
prFields = lens _prFields (\ s a -> s{_prFields = a})

-- | Data format for the response.
prAlt :: Lens' PagespeedapiRunpagespeed' Text
prAlt = lens _prAlt (\ s a -> s{_prAlt = a})

instance GoogleRequest PagespeedapiRunpagespeed'
         where
        type Rs PagespeedapiRunpagespeed' = Result
        request = requestWithRoute defReq pageSpeedURL
        requestWithRoute r u PagespeedapiRunpagespeed{..}
          = go (Just _prScreenshot) _prQuotaUser _prPrettyPrint
              _prUserIp
              _prLocale
              (Just _prUrl)
              (Just _prFilterThirdPartyResources)
              _prStrategy
              _prRule
              _prKey
              _prOauthToken
              _prFields
              _prAlt
          where go
                  = clientWithRoute
                      (Proxy :: Proxy PagespeedapiRunpagespeedAPI)
                      r
                      u