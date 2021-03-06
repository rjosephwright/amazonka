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
-- Module      : Network.AWS.CloudWatch.DescribeAlarmsForMetric
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves all alarms for a single metric. Specify a statistic, period,
-- or unit to filter the set of alarms further.
--
-- /See:/ <http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarmsForMetric.html AWS API Reference> for DescribeAlarmsForMetric.
module Network.AWS.CloudWatch.DescribeAlarmsForMetric
    (
    -- * Creating a Request
      describeAlarmsForMetric
    , DescribeAlarmsForMetric
    -- * Request Lenses
    , dafmPeriod
    , dafmDimensions
    , dafmUnit
    , dafmStatistic
    , dafmMetricName
    , dafmNamespace

    -- * Destructuring the Response
    , describeAlarmsForMetricResponse
    , DescribeAlarmsForMetricResponse
    -- * Response Lenses
    , dafmrsMetricAlarms
    , dafmrsResponseStatus
    ) where

import           Network.AWS.CloudWatch.Types
import           Network.AWS.CloudWatch.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'describeAlarmsForMetric' smart constructor.
data DescribeAlarmsForMetric = DescribeAlarmsForMetric'
    { _dafmPeriod     :: !(Maybe Nat)
    , _dafmDimensions :: !(Maybe [Dimension])
    , _dafmUnit       :: !(Maybe StandardUnit)
    , _dafmStatistic  :: !(Maybe Statistic)
    , _dafmMetricName :: !Text
    , _dafmNamespace  :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeAlarmsForMetric' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dafmPeriod'
--
-- * 'dafmDimensions'
--
-- * 'dafmUnit'
--
-- * 'dafmStatistic'
--
-- * 'dafmMetricName'
--
-- * 'dafmNamespace'
describeAlarmsForMetric
    :: Text -- ^ 'dafmMetricName'
    -> Text -- ^ 'dafmNamespace'
    -> DescribeAlarmsForMetric
describeAlarmsForMetric pMetricName_ pNamespace_ =
    DescribeAlarmsForMetric'
    { _dafmPeriod = Nothing
    , _dafmDimensions = Nothing
    , _dafmUnit = Nothing
    , _dafmStatistic = Nothing
    , _dafmMetricName = pMetricName_
    , _dafmNamespace = pNamespace_
    }

-- | The period in seconds over which the statistic is applied.
dafmPeriod :: Lens' DescribeAlarmsForMetric (Maybe Natural)
dafmPeriod = lens _dafmPeriod (\ s a -> s{_dafmPeriod = a}) . mapping _Nat;

-- | The list of dimensions associated with the metric.
dafmDimensions :: Lens' DescribeAlarmsForMetric [Dimension]
dafmDimensions = lens _dafmDimensions (\ s a -> s{_dafmDimensions = a}) . _Default . _Coerce;

-- | The unit for the metric.
dafmUnit :: Lens' DescribeAlarmsForMetric (Maybe StandardUnit)
dafmUnit = lens _dafmUnit (\ s a -> s{_dafmUnit = a});

-- | The statistic for the metric.
dafmStatistic :: Lens' DescribeAlarmsForMetric (Maybe Statistic)
dafmStatistic = lens _dafmStatistic (\ s a -> s{_dafmStatistic = a});

-- | The name of the metric.
dafmMetricName :: Lens' DescribeAlarmsForMetric Text
dafmMetricName = lens _dafmMetricName (\ s a -> s{_dafmMetricName = a});

-- | The namespace of the metric.
dafmNamespace :: Lens' DescribeAlarmsForMetric Text
dafmNamespace = lens _dafmNamespace (\ s a -> s{_dafmNamespace = a});

instance AWSRequest DescribeAlarmsForMetric where
        type Rs DescribeAlarmsForMetric =
             DescribeAlarmsForMetricResponse
        request = postQuery cloudWatch
        response
          = receiveXMLWrapper "DescribeAlarmsForMetricResult"
              (\ s h x ->
                 DescribeAlarmsForMetricResponse' <$>
                   (x .@? "MetricAlarms" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (pure (fromEnum s)))

instance ToHeaders DescribeAlarmsForMetric where
        toHeaders = const mempty

instance ToPath DescribeAlarmsForMetric where
        toPath = const "/"

instance ToQuery DescribeAlarmsForMetric where
        toQuery DescribeAlarmsForMetric'{..}
          = mconcat
              ["Action" =:
                 ("DescribeAlarmsForMetric" :: ByteString),
               "Version" =: ("2010-08-01" :: ByteString),
               "Period" =: _dafmPeriod,
               "Dimensions" =:
                 toQuery (toQueryList "member" <$> _dafmDimensions),
               "Unit" =: _dafmUnit, "Statistic" =: _dafmStatistic,
               "MetricName" =: _dafmMetricName,
               "Namespace" =: _dafmNamespace]

-- | The output for the DescribeAlarmsForMetric action.
--
-- /See:/ 'describeAlarmsForMetricResponse' smart constructor.
data DescribeAlarmsForMetricResponse = DescribeAlarmsForMetricResponse'
    { _dafmrsMetricAlarms   :: !(Maybe [MetricAlarm])
    , _dafmrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeAlarmsForMetricResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dafmrsMetricAlarms'
--
-- * 'dafmrsResponseStatus'
describeAlarmsForMetricResponse
    :: Int -- ^ 'dafmrsResponseStatus'
    -> DescribeAlarmsForMetricResponse
describeAlarmsForMetricResponse pResponseStatus_ =
    DescribeAlarmsForMetricResponse'
    { _dafmrsMetricAlarms = Nothing
    , _dafmrsResponseStatus = pResponseStatus_
    }

-- | A list of information for each alarm with the specified metric.
dafmrsMetricAlarms :: Lens' DescribeAlarmsForMetricResponse [MetricAlarm]
dafmrsMetricAlarms = lens _dafmrsMetricAlarms (\ s a -> s{_dafmrsMetricAlarms = a}) . _Default . _Coerce;

-- | The response status code.
dafmrsResponseStatus :: Lens' DescribeAlarmsForMetricResponse Int
dafmrsResponseStatus = lens _dafmrsResponseStatus (\ s a -> s{_dafmrsResponseStatus = a});
