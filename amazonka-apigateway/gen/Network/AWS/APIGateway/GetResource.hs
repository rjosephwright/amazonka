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
-- Module      : Network.AWS.APIGateway.GetResource
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists information about a resource.
--
-- /See:/ <http://docs.aws.amazon.com/apigateway/api-reference/resource/GetResource.html AWS API Reference> for GetResource.
module Network.AWS.APIGateway.GetResource
    (
    -- * Creating a Request
      getResource
    , GetResource
    -- * Request Lenses
    , grRestAPIId
    , grResourceId

    -- * Destructuring the Response
    , resource
    , Resource
    -- * Response Lenses
    , rPathPart
    , rPath
    , rId
    , rResourceMethods
    , rParentId
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Request to list information about a resource.
--
-- /See:/ 'getResource' smart constructor.
data GetResource = GetResource'
    { _grRestAPIId  :: !Text
    , _grResourceId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetResource' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'grRestAPIId'
--
-- * 'grResourceId'
getResource
    :: Text -- ^ 'grRestAPIId'
    -> Text -- ^ 'grResourceId'
    -> GetResource
getResource pRestAPIId_ pResourceId_ =
    GetResource'
    { _grRestAPIId = pRestAPIId_
    , _grResourceId = pResourceId_
    }

-- | The RestApi identifier for the resource.
grRestAPIId :: Lens' GetResource Text
grRestAPIId = lens _grRestAPIId (\ s a -> s{_grRestAPIId = a});

-- | The identifier for the Resource resource.
grResourceId :: Lens' GetResource Text
grResourceId = lens _grResourceId (\ s a -> s{_grResourceId = a});

instance AWSRequest GetResource where
        type Rs GetResource = Resource
        request = get aPIGateway
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance ToHeaders GetResource where
        toHeaders = const mempty

instance ToPath GetResource where
        toPath GetResource'{..}
          = mconcat
              ["/restapis/", toBS _grRestAPIId, "/resources/",
               toBS _grResourceId]

instance ToQuery GetResource where
        toQuery = const mempty
