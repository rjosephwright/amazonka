{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.APIGateway.GetBasePathMappings
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Represents a collection of BasePathMapping resources.
--
-- /See:/ <http://docs.aws.amazon.com/apigateway/api-reference/resource/GetBasePathMappings.html AWS API Reference> for GetBasePathMappings.
--
-- This operation returns paginated results.
module Network.AWS.APIGateway.GetBasePathMappings
    (
    -- * Creating a Request
      getBasePathMappings
    , GetBasePathMappings
    -- * Request Lenses
    , gLimit
    , gPosition
    , gDomainName

    -- * Destructuring the Response
    , getBasePathMappingsResponse
    , GetBasePathMappingsResponse
    -- * Response Lenses
    , gbpmrsItems
    , gbpmrsPosition
    , gbpmrsResponseStatus
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Pager
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | A request to get information about a collection of BasePathMapping
-- resources.
--
-- /See:/ 'getBasePathMappings' smart constructor.
data GetBasePathMappings = GetBasePathMappings'
    { _gLimit      :: !(Maybe Int)
    , _gPosition   :: !(Maybe Text)
    , _gDomainName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetBasePathMappings' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gLimit'
--
-- * 'gPosition'
--
-- * 'gDomainName'
getBasePathMappings
    :: Text -- ^ 'gDomainName'
    -> GetBasePathMappings
getBasePathMappings pDomainName_ =
    GetBasePathMappings'
    { _gLimit = Nothing
    , _gPosition = Nothing
    , _gDomainName = pDomainName_
    }

-- | The maximum number of BasePathMapping resources in the collection to get
-- information about. The default limit is 25. It should be an integer
-- between 1 - 500.
gLimit :: Lens' GetBasePathMappings (Maybe Int)
gLimit = lens _gLimit (\ s a -> s{_gLimit = a});

-- | The position of the current BasePathMapping resource in the collection
-- to get information about.
gPosition :: Lens' GetBasePathMappings (Maybe Text)
gPosition = lens _gPosition (\ s a -> s{_gPosition = a});

-- | The domain name of a BasePathMapping resource.
gDomainName :: Lens' GetBasePathMappings Text
gDomainName = lens _gDomainName (\ s a -> s{_gDomainName = a});

instance AWSPager GetBasePathMappings where
        page rq rs
          | stop (rs ^. gbpmrsPosition) = Nothing
          | stop (rs ^. gbpmrsItems) = Nothing
          | otherwise =
            Just $ rq & gPosition .~ rs ^. gbpmrsPosition

instance AWSRequest GetBasePathMappings where
        type Rs GetBasePathMappings =
             GetBasePathMappingsResponse
        request = get aPIGateway
        response
          = receiveJSON
              (\ s h x ->
                 GetBasePathMappingsResponse' <$>
                   (x .?> "item" .!@ mempty) <*> (x .?> "position") <*>
                     (pure (fromEnum s)))

instance ToHeaders GetBasePathMappings where
        toHeaders = const mempty

instance ToPath GetBasePathMappings where
        toPath GetBasePathMappings'{..}
          = mconcat
              ["/domainnames/", toBS _gDomainName,
               "/basepathmappings"]

instance ToQuery GetBasePathMappings where
        toQuery GetBasePathMappings'{..}
          = mconcat
              ["limit" =: _gLimit, "position" =: _gPosition]

-- | Represents a collection of BasePathMapping resources.
--
-- /See:/ 'getBasePathMappingsResponse' smart constructor.
data GetBasePathMappingsResponse = GetBasePathMappingsResponse'
    { _gbpmrsItems          :: !(Maybe [BasePathMapping])
    , _gbpmrsPosition       :: !(Maybe Text)
    , _gbpmrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetBasePathMappingsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gbpmrsItems'
--
-- * 'gbpmrsPosition'
--
-- * 'gbpmrsResponseStatus'
getBasePathMappingsResponse
    :: Int -- ^ 'gbpmrsResponseStatus'
    -> GetBasePathMappingsResponse
getBasePathMappingsResponse pResponseStatus_ =
    GetBasePathMappingsResponse'
    { _gbpmrsItems = Nothing
    , _gbpmrsPosition = Nothing
    , _gbpmrsResponseStatus = pResponseStatus_
    }

-- | The current page of any BasePathMapping resources in the collection of
-- base path mapping resources.
gbpmrsItems :: Lens' GetBasePathMappingsResponse [BasePathMapping]
gbpmrsItems = lens _gbpmrsItems (\ s a -> s{_gbpmrsItems = a}) . _Default . _Coerce;

-- | Undocumented member.
gbpmrsPosition :: Lens' GetBasePathMappingsResponse (Maybe Text)
gbpmrsPosition = lens _gbpmrsPosition (\ s a -> s{_gbpmrsPosition = a});

-- | The response status code.
gbpmrsResponseStatus :: Lens' GetBasePathMappingsResponse Int
gbpmrsResponseStatus = lens _gbpmrsResponseStatus (\ s a -> s{_gbpmrsResponseStatus = a});
