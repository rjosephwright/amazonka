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
-- Module      : Network.AWS.APIGateway.DeleteStage
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a Stage resource.
--
-- /See:/ <http://docs.aws.amazon.com/apigateway/api-reference/resource/DeleteStage.html AWS API Reference> for DeleteStage.
module Network.AWS.APIGateway.DeleteStage
    (
    -- * Creating a Request
      deleteStage
    , DeleteStage
    -- * Request Lenses
    , dsRestAPIId
    , dsStageName

    -- * Destructuring the Response
    , deleteStageResponse
    , DeleteStageResponse
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Requests Amazon API Gateway to delete a Stage resource.
--
-- /See:/ 'deleteStage' smart constructor.
data DeleteStage = DeleteStage'
    { _dsRestAPIId :: !Text
    , _dsStageName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteStage' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dsRestAPIId'
--
-- * 'dsStageName'
deleteStage
    :: Text -- ^ 'dsRestAPIId'
    -> Text -- ^ 'dsStageName'
    -> DeleteStage
deleteStage pRestAPIId_ pStageName_ =
    DeleteStage'
    { _dsRestAPIId = pRestAPIId_
    , _dsStageName = pStageName_
    }

-- | The identifier of the RestApi resource for the Stage resource to delete.
dsRestAPIId :: Lens' DeleteStage Text
dsRestAPIId = lens _dsRestAPIId (\ s a -> s{_dsRestAPIId = a});

-- | The name of the Stage resource to delete.
dsStageName :: Lens' DeleteStage Text
dsStageName = lens _dsStageName (\ s a -> s{_dsStageName = a});

instance AWSRequest DeleteStage where
        type Rs DeleteStage = DeleteStageResponse
        request = delete aPIGateway
        response = receiveNull DeleteStageResponse'

instance ToHeaders DeleteStage where
        toHeaders = const mempty

instance ToPath DeleteStage where
        toPath DeleteStage'{..}
          = mconcat
              ["/restapis/", toBS _dsRestAPIId, "/stages/",
               toBS _dsStageName]

instance ToQuery DeleteStage where
        toQuery = const mempty

-- | /See:/ 'deleteStageResponse' smart constructor.
data DeleteStageResponse =
    DeleteStageResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteStageResponse' with the minimum fields required to make a request.
--
deleteStageResponse
    :: DeleteStageResponse
deleteStageResponse = DeleteStageResponse'
