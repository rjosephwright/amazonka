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
-- Module      : Network.AWS.Inspector.UpdateAssessment
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates the assessment specified by the assessment ARN.
--
-- /See:/ <http://docs.aws.amazon.com/inspector/latest/APIReference/API_UpdateAssessment.html AWS API Reference> for UpdateAssessment.
module Network.AWS.Inspector.UpdateAssessment
    (
    -- * Creating a Request
      updateAssessment
    , UpdateAssessment
    -- * Request Lenses
    , uaAssessmentARN
    , uaDurationInSeconds
    , uaAssessmentName

    -- * Destructuring the Response
    , updateAssessmentResponse
    , UpdateAssessmentResponse
    -- * Response Lenses
    , ursMessage
    , ursResponseStatus
    ) where

import           Network.AWS.Inspector.Types
import           Network.AWS.Inspector.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'updateAssessment' smart constructor.
data UpdateAssessment = UpdateAssessment'
    { _uaAssessmentARN     :: !(Maybe Text)
    , _uaDurationInSeconds :: !(Maybe Int)
    , _uaAssessmentName    :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UpdateAssessment' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uaAssessmentARN'
--
-- * 'uaDurationInSeconds'
--
-- * 'uaAssessmentName'
updateAssessment
    :: UpdateAssessment
updateAssessment =
    UpdateAssessment'
    { _uaAssessmentARN = Nothing
    , _uaDurationInSeconds = Nothing
    , _uaAssessmentName = Nothing
    }

-- | Asessment ARN that you want to update.
uaAssessmentARN :: Lens' UpdateAssessment (Maybe Text)
uaAssessmentARN = lens _uaAssessmentARN (\ s a -> s{_uaAssessmentARN = a});

-- | Assessment duration in seconds that you want to update. The default
-- value is 3600 seconds (one hour). The maximum value is 86400 seconds
-- (one day).
uaDurationInSeconds :: Lens' UpdateAssessment (Maybe Int)
uaDurationInSeconds = lens _uaDurationInSeconds (\ s a -> s{_uaDurationInSeconds = a});

-- | Assessment name that you want to update.
uaAssessmentName :: Lens' UpdateAssessment (Maybe Text)
uaAssessmentName = lens _uaAssessmentName (\ s a -> s{_uaAssessmentName = a});

instance AWSRequest UpdateAssessment where
        type Rs UpdateAssessment = UpdateAssessmentResponse
        request = postJSON inspector
        response
          = receiveJSON
              (\ s h x ->
                 UpdateAssessmentResponse' <$>
                   (x .?> "message") <*> (pure (fromEnum s)))

instance ToHeaders UpdateAssessment where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("InspectorService.UpdateAssessment" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateAssessment where
        toJSON UpdateAssessment'{..}
          = object
              (catMaybes
                 [("assessmentArn" .=) <$> _uaAssessmentARN,
                  ("durationInSeconds" .=) <$> _uaDurationInSeconds,
                  ("assessmentName" .=) <$> _uaAssessmentName])

instance ToPath UpdateAssessment where
        toPath = const "/"

instance ToQuery UpdateAssessment where
        toQuery = const mempty

-- | /See:/ 'updateAssessmentResponse' smart constructor.
data UpdateAssessmentResponse = UpdateAssessmentResponse'
    { _ursMessage        :: !(Maybe Text)
    , _ursResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UpdateAssessmentResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ursMessage'
--
-- * 'ursResponseStatus'
updateAssessmentResponse
    :: Int -- ^ 'ursResponseStatus'
    -> UpdateAssessmentResponse
updateAssessmentResponse pResponseStatus_ =
    UpdateAssessmentResponse'
    { _ursMessage = Nothing
    , _ursResponseStatus = pResponseStatus_
    }

-- | Confirmation details of the action performed.
ursMessage :: Lens' UpdateAssessmentResponse (Maybe Text)
ursMessage = lens _ursMessage (\ s a -> s{_ursMessage = a});

-- | The response status code.
ursResponseStatus :: Lens' UpdateAssessmentResponse Int
ursResponseStatus = lens _ursResponseStatus (\ s a -> s{_ursResponseStatus = a});
