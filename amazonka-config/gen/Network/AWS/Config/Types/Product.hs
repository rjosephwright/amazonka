{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Config.Types.Product
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.Config.Types.Product where

import           Network.AWS.Config.Types.Sum
import           Network.AWS.Prelude

-- | Indicates whether an AWS resource or AWS Config rule is compliant and
-- provides the number of contributors that affect the compliance.
--
-- /See:/ 'compliance' smart constructor.
data Compliance = Compliance'
    { _cComplianceContributorCount :: !(Maybe ComplianceContributorCount)
    , _cComplianceType             :: !(Maybe ComplianceType)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Compliance' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cComplianceContributorCount'
--
-- * 'cComplianceType'
compliance
    :: Compliance
compliance =
    Compliance'
    { _cComplianceContributorCount = Nothing
    , _cComplianceType = Nothing
    }

-- | The number of AWS resources or AWS Config rules that cause a result of
-- 'NON_COMPLIANT', up to a maximum of 25.
cComplianceContributorCount :: Lens' Compliance (Maybe ComplianceContributorCount)
cComplianceContributorCount = lens _cComplianceContributorCount (\ s a -> s{_cComplianceContributorCount = a});

-- | Indicates whether an AWS resource or AWS Config rule is compliant.
--
-- A resource is compliant if it complies with all of the AWS Config rules
-- that evaluate it, and it is noncompliant if it does not comply with one
-- or more of these rules.
--
-- A rule is compliant if all of the resources that the rule evaluates
-- comply with it, and it is noncompliant if any of these resources do not
-- comply.
cComplianceType :: Lens' Compliance (Maybe ComplianceType)
cComplianceType = lens _cComplianceType (\ s a -> s{_cComplianceType = a});

instance FromJSON Compliance where
        parseJSON
          = withObject "Compliance"
              (\ x ->
                 Compliance' <$>
                   (x .:? "ComplianceContributorCount") <*>
                     (x .:? "ComplianceType"))

-- | Indicates whether an AWS Config rule is compliant. A rule is compliant
-- if all of the resources that the rule evaluated comply with it, and it
-- is noncompliant if any of these resources do not comply.
--
-- /See:/ 'complianceByConfigRule' smart constructor.
data ComplianceByConfigRule = ComplianceByConfigRule'
    { _cbcrCompliance     :: !(Maybe Compliance)
    , _cbcrConfigRuleName :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ComplianceByConfigRule' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cbcrCompliance'
--
-- * 'cbcrConfigRuleName'
complianceByConfigRule
    :: ComplianceByConfigRule
complianceByConfigRule =
    ComplianceByConfigRule'
    { _cbcrCompliance = Nothing
    , _cbcrConfigRuleName = Nothing
    }

-- | Indicates whether the AWS Config rule is compliant.
cbcrCompliance :: Lens' ComplianceByConfigRule (Maybe Compliance)
cbcrCompliance = lens _cbcrCompliance (\ s a -> s{_cbcrCompliance = a});

-- | The name of the AWS Config rule.
cbcrConfigRuleName :: Lens' ComplianceByConfigRule (Maybe Text)
cbcrConfigRuleName = lens _cbcrConfigRuleName (\ s a -> s{_cbcrConfigRuleName = a});

instance FromJSON ComplianceByConfigRule where
        parseJSON
          = withObject "ComplianceByConfigRule"
              (\ x ->
                 ComplianceByConfigRule' <$>
                   (x .:? "Compliance") <*> (x .:? "ConfigRuleName"))

-- | Indicates whether an AWS resource that is evaluated according to one or
-- more AWS Config rules is compliant. A resource is compliant if it
-- complies with all of the rules that evaluate it, and it is noncompliant
-- if it does not comply with one or more of these rules.
--
-- /See:/ 'complianceByResource' smart constructor.
data ComplianceByResource = ComplianceByResource'
    { _cbrResourceId   :: !(Maybe Text)
    , _cbrResourceType :: !(Maybe Text)
    , _cbrCompliance   :: !(Maybe Compliance)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ComplianceByResource' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cbrResourceId'
--
-- * 'cbrResourceType'
--
-- * 'cbrCompliance'
complianceByResource
    :: ComplianceByResource
complianceByResource =
    ComplianceByResource'
    { _cbrResourceId = Nothing
    , _cbrResourceType = Nothing
    , _cbrCompliance = Nothing
    }

-- | The ID of the AWS resource that was evaluated.
cbrResourceId :: Lens' ComplianceByResource (Maybe Text)
cbrResourceId = lens _cbrResourceId (\ s a -> s{_cbrResourceId = a});

-- | The type of the AWS resource that was evaluated.
cbrResourceType :: Lens' ComplianceByResource (Maybe Text)
cbrResourceType = lens _cbrResourceType (\ s a -> s{_cbrResourceType = a});

-- | Indicates whether the AWS resource complies with all of the AWS Config
-- rules that evaluated it.
cbrCompliance :: Lens' ComplianceByResource (Maybe Compliance)
cbrCompliance = lens _cbrCompliance (\ s a -> s{_cbrCompliance = a});

instance FromJSON ComplianceByResource where
        parseJSON
          = withObject "ComplianceByResource"
              (\ x ->
                 ComplianceByResource' <$>
                   (x .:? "ResourceId") <*> (x .:? "ResourceType") <*>
                     (x .:? "Compliance"))

-- | The number of AWS resources or AWS Config rules responsible for the
-- current compliance of the item, up to a maximum number.
--
-- /See:/ 'complianceContributorCount' smart constructor.
data ComplianceContributorCount = ComplianceContributorCount'
    { _cccCappedCount :: !(Maybe Int)
    , _cccCapExceeded :: !(Maybe Bool)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ComplianceContributorCount' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cccCappedCount'
--
-- * 'cccCapExceeded'
complianceContributorCount
    :: ComplianceContributorCount
complianceContributorCount =
    ComplianceContributorCount'
    { _cccCappedCount = Nothing
    , _cccCapExceeded = Nothing
    }

-- | The number of AWS resources or AWS Config rules responsible for the
-- current compliance of the item.
cccCappedCount :: Lens' ComplianceContributorCount (Maybe Int)
cccCappedCount = lens _cccCappedCount (\ s a -> s{_cccCappedCount = a});

-- | Indicates whether the maximum count is reached.
cccCapExceeded :: Lens' ComplianceContributorCount (Maybe Bool)
cccCapExceeded = lens _cccCapExceeded (\ s a -> s{_cccCapExceeded = a});

instance FromJSON ComplianceContributorCount where
        parseJSON
          = withObject "ComplianceContributorCount"
              (\ x ->
                 ComplianceContributorCount' <$>
                   (x .:? "CappedCount") <*> (x .:? "CapExceeded"))

-- | The number of AWS Config rules or AWS resources that are compliant and
-- noncompliant, up to a maximum.
--
-- /See:/ 'complianceSummary' smart constructor.
data ComplianceSummary = ComplianceSummary'
    { _csComplianceSummaryTimestamp :: !(Maybe POSIX)
    , _csCompliantResourceCount     :: !(Maybe ComplianceContributorCount)
    , _csNonCompliantResourceCount  :: !(Maybe ComplianceContributorCount)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ComplianceSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csComplianceSummaryTimestamp'
--
-- * 'csCompliantResourceCount'
--
-- * 'csNonCompliantResourceCount'
complianceSummary
    :: ComplianceSummary
complianceSummary =
    ComplianceSummary'
    { _csComplianceSummaryTimestamp = Nothing
    , _csCompliantResourceCount = Nothing
    , _csNonCompliantResourceCount = Nothing
    }

-- | The time that AWS Config created the compliance summary.
csComplianceSummaryTimestamp :: Lens' ComplianceSummary (Maybe UTCTime)
csComplianceSummaryTimestamp = lens _csComplianceSummaryTimestamp (\ s a -> s{_csComplianceSummaryTimestamp = a}) . mapping _Time;

-- | The number of AWS Config rules or AWS resources that are compliant, up
-- to a maximum of 25 for rules and 100 for resources.
csCompliantResourceCount :: Lens' ComplianceSummary (Maybe ComplianceContributorCount)
csCompliantResourceCount = lens _csCompliantResourceCount (\ s a -> s{_csCompliantResourceCount = a});

-- | The number of AWS Config rules or AWS resources that are noncompliant,
-- up to a maximum of 25 for rules and 100 for resources.
csNonCompliantResourceCount :: Lens' ComplianceSummary (Maybe ComplianceContributorCount)
csNonCompliantResourceCount = lens _csNonCompliantResourceCount (\ s a -> s{_csNonCompliantResourceCount = a});

instance FromJSON ComplianceSummary where
        parseJSON
          = withObject "ComplianceSummary"
              (\ x ->
                 ComplianceSummary' <$>
                   (x .:? "ComplianceSummaryTimestamp") <*>
                     (x .:? "CompliantResourceCount")
                     <*> (x .:? "NonCompliantResourceCount"))

-- | The number of AWS resources of a specific type that are compliant or
-- noncompliant, up to a maximum of 100 for each compliance.
--
-- /See:/ 'complianceSummaryByResourceType' smart constructor.
data ComplianceSummaryByResourceType = ComplianceSummaryByResourceType'
    { _csbrtResourceType      :: !(Maybe Text)
    , _csbrtComplianceSummary :: !(Maybe ComplianceSummary)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ComplianceSummaryByResourceType' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csbrtResourceType'
--
-- * 'csbrtComplianceSummary'
complianceSummaryByResourceType
    :: ComplianceSummaryByResourceType
complianceSummaryByResourceType =
    ComplianceSummaryByResourceType'
    { _csbrtResourceType = Nothing
    , _csbrtComplianceSummary = Nothing
    }

-- | The type of AWS resource.
csbrtResourceType :: Lens' ComplianceSummaryByResourceType (Maybe Text)
csbrtResourceType = lens _csbrtResourceType (\ s a -> s{_csbrtResourceType = a});

-- | The number of AWS resources that are compliant or noncompliant, up to a
-- maximum of 100 for each compliance.
csbrtComplianceSummary :: Lens' ComplianceSummaryByResourceType (Maybe ComplianceSummary)
csbrtComplianceSummary = lens _csbrtComplianceSummary (\ s a -> s{_csbrtComplianceSummary = a});

instance FromJSON ComplianceSummaryByResourceType
         where
        parseJSON
          = withObject "ComplianceSummaryByResourceType"
              (\ x ->
                 ComplianceSummaryByResourceType' <$>
                   (x .:? "ResourceType") <*>
                     (x .:? "ComplianceSummary"))

-- | A list that contains the status of the delivery of either the snapshot
-- or the configuration history to the specified Amazon S3 bucket.
--
-- /See:/ 'configExportDeliveryInfo' smart constructor.
data ConfigExportDeliveryInfo = ConfigExportDeliveryInfo'
    { _cediLastErrorCode      :: !(Maybe Text)
    , _cediLastAttemptTime    :: !(Maybe POSIX)
    , _cediLastSuccessfulTime :: !(Maybe POSIX)
    , _cediLastStatus         :: !(Maybe DeliveryStatus)
    , _cediLastErrorMessage   :: !(Maybe Text)
    , _cediNextDeliveryTime   :: !(Maybe POSIX)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigExportDeliveryInfo' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cediLastErrorCode'
--
-- * 'cediLastAttemptTime'
--
-- * 'cediLastSuccessfulTime'
--
-- * 'cediLastStatus'
--
-- * 'cediLastErrorMessage'
--
-- * 'cediNextDeliveryTime'
configExportDeliveryInfo
    :: ConfigExportDeliveryInfo
configExportDeliveryInfo =
    ConfigExportDeliveryInfo'
    { _cediLastErrorCode = Nothing
    , _cediLastAttemptTime = Nothing
    , _cediLastSuccessfulTime = Nothing
    , _cediLastStatus = Nothing
    , _cediLastErrorMessage = Nothing
    , _cediNextDeliveryTime = Nothing
    }

-- | The error code from the last attempted delivery.
cediLastErrorCode :: Lens' ConfigExportDeliveryInfo (Maybe Text)
cediLastErrorCode = lens _cediLastErrorCode (\ s a -> s{_cediLastErrorCode = a});

-- | The time of the last attempted delivery.
cediLastAttemptTime :: Lens' ConfigExportDeliveryInfo (Maybe UTCTime)
cediLastAttemptTime = lens _cediLastAttemptTime (\ s a -> s{_cediLastAttemptTime = a}) . mapping _Time;

-- | The time of the last successful delivery.
cediLastSuccessfulTime :: Lens' ConfigExportDeliveryInfo (Maybe UTCTime)
cediLastSuccessfulTime = lens _cediLastSuccessfulTime (\ s a -> s{_cediLastSuccessfulTime = a}) . mapping _Time;

-- | Status of the last attempted delivery.
cediLastStatus :: Lens' ConfigExportDeliveryInfo (Maybe DeliveryStatus)
cediLastStatus = lens _cediLastStatus (\ s a -> s{_cediLastStatus = a});

-- | The error message from the last attempted delivery.
cediLastErrorMessage :: Lens' ConfigExportDeliveryInfo (Maybe Text)
cediLastErrorMessage = lens _cediLastErrorMessage (\ s a -> s{_cediLastErrorMessage = a});

-- | The time that the next delivery occurs.
cediNextDeliveryTime :: Lens' ConfigExportDeliveryInfo (Maybe UTCTime)
cediNextDeliveryTime = lens _cediNextDeliveryTime (\ s a -> s{_cediNextDeliveryTime = a}) . mapping _Time;

instance FromJSON ConfigExportDeliveryInfo where
        parseJSON
          = withObject "ConfigExportDeliveryInfo"
              (\ x ->
                 ConfigExportDeliveryInfo' <$>
                   (x .:? "lastErrorCode") <*> (x .:? "lastAttemptTime")
                     <*> (x .:? "lastSuccessfulTime")
                     <*> (x .:? "lastStatus")
                     <*> (x .:? "lastErrorMessage")
                     <*> (x .:? "nextDeliveryTime"))

-- | An AWS Lambda function that evaluates configuration items to assess
-- whether your AWS resources comply with your desired configurations. This
-- function can run when AWS Config detects a configuration change or
-- delivers a configuration snapshot. This function can evaluate any
-- resource in the recording group. To define which of these are evaluated,
-- specify a value for the 'Scope' key.
--
-- For more information about developing and using AWS Config rules, see
-- <http://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html Evaluating AWS Resource Configurations with AWS Config>
-- in the /AWS Config Developer Guide/.
--
-- /See:/ 'configRule' smart constructor.
data ConfigRule = ConfigRule'
    { _crInputParameters           :: !(Maybe Text)
    , _crConfigRuleName            :: !(Maybe Text)
    , _crMaximumExecutionFrequency :: !(Maybe MaximumExecutionFrequency)
    , _crConfigRuleId              :: !(Maybe Text)
    , _crScope                     :: !(Maybe Scope)
    , _crConfigRuleState           :: !(Maybe ConfigRuleState)
    , _crDescription               :: !(Maybe Text)
    , _crConfigRuleARN             :: !(Maybe Text)
    , _crSource                    :: !Source
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigRule' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crInputParameters'
--
-- * 'crConfigRuleName'
--
-- * 'crMaximumExecutionFrequency'
--
-- * 'crConfigRuleId'
--
-- * 'crScope'
--
-- * 'crConfigRuleState'
--
-- * 'crDescription'
--
-- * 'crConfigRuleARN'
--
-- * 'crSource'
configRule
    :: Source -- ^ 'crSource'
    -> ConfigRule
configRule pSource_ =
    ConfigRule'
    { _crInputParameters = Nothing
    , _crConfigRuleName = Nothing
    , _crMaximumExecutionFrequency = Nothing
    , _crConfigRuleId = Nothing
    , _crScope = Nothing
    , _crConfigRuleState = Nothing
    , _crDescription = Nothing
    , _crConfigRuleARN = Nothing
    , _crSource = pSource_
    }

-- | A string in JSON format that is passed to the AWS Config rule Lambda
-- function.
crInputParameters :: Lens' ConfigRule (Maybe Text)
crInputParameters = lens _crInputParameters (\ s a -> s{_crInputParameters = a});

-- | The name that you assign to the AWS Config rule. The name is required if
-- you are adding a new rule.
crConfigRuleName :: Lens' ConfigRule (Maybe Text)
crConfigRuleName = lens _crConfigRuleName (\ s a -> s{_crConfigRuleName = a});

-- | The maximum frequency at which the AWS Config rule runs evaluations.
--
-- If your rule is periodic, meaning it runs an evaluation when AWS Config
-- delivers a configuration snapshot, then it cannot run evaluations more
-- frequently than AWS Config delivers the snapshots. For periodic rules,
-- set the value of the 'MaximumExecutionFrequency' key to be equal to or
-- greater than the value of the 'deliveryFrequency' key, which is part of
-- 'ConfigSnapshotDeliveryProperties'. To update the frequency with which
-- AWS Config delivers your snapshots, use the 'PutDeliveryChannel' action.
crMaximumExecutionFrequency :: Lens' ConfigRule (Maybe MaximumExecutionFrequency)
crMaximumExecutionFrequency = lens _crMaximumExecutionFrequency (\ s a -> s{_crMaximumExecutionFrequency = a});

-- | The ID of the AWS Config rule.
crConfigRuleId :: Lens' ConfigRule (Maybe Text)
crConfigRuleId = lens _crConfigRuleId (\ s a -> s{_crConfigRuleId = a});

-- | Defines which resources the AWS Config rule evaluates. The scope can
-- include one or more resource types, a combination of a tag key and
-- value, or a combination of one resource type and one or more resource
-- IDs. Specify a scope to constrain the resources that are evaluated. If
-- you do not specify a scope, the AWS Config Rule evaluates all resources
-- in the recording group.
crScope :: Lens' ConfigRule (Maybe Scope)
crScope = lens _crScope (\ s a -> s{_crScope = a});

-- | Indicates whether the AWS Config rule is active or currently being
-- deleted by AWS Config.
--
-- AWS Config sets the state of a rule to 'DELETING' temporarily after you
-- use the 'DeleteConfigRule' request to delete the rule. After AWS Config
-- finishes deleting a rule, the rule and all of its evaluations are erased
-- and no longer available.
--
-- You cannot add a rule to AWS Config that has the state set to
-- 'DELETING'. If you want to delete a rule, you must use the
-- 'DeleteConfigRule' request.
crConfigRuleState :: Lens' ConfigRule (Maybe ConfigRuleState)
crConfigRuleState = lens _crConfigRuleState (\ s a -> s{_crConfigRuleState = a});

-- | The description that you provide for the AWS Config rule.
crDescription :: Lens' ConfigRule (Maybe Text)
crDescription = lens _crDescription (\ s a -> s{_crDescription = a});

-- | The Amazon Resource Name (ARN) of the AWS Config rule.
crConfigRuleARN :: Lens' ConfigRule (Maybe Text)
crConfigRuleARN = lens _crConfigRuleARN (\ s a -> s{_crConfigRuleARN = a});

-- | Provides the rule owner (AWS or customer), the rule identifier, and the
-- events that cause the function to evaluate your AWS resources.
crSource :: Lens' ConfigRule Source
crSource = lens _crSource (\ s a -> s{_crSource = a});

instance FromJSON ConfigRule where
        parseJSON
          = withObject "ConfigRule"
              (\ x ->
                 ConfigRule' <$>
                   (x .:? "InputParameters") <*>
                     (x .:? "ConfigRuleName")
                     <*> (x .:? "MaximumExecutionFrequency")
                     <*> (x .:? "ConfigRuleId")
                     <*> (x .:? "Scope")
                     <*> (x .:? "ConfigRuleState")
                     <*> (x .:? "Description")
                     <*> (x .:? "ConfigRuleArn")
                     <*> (x .: "Source"))

instance ToJSON ConfigRule where
        toJSON ConfigRule'{..}
          = object
              (catMaybes
                 [("InputParameters" .=) <$> _crInputParameters,
                  ("ConfigRuleName" .=) <$> _crConfigRuleName,
                  ("MaximumExecutionFrequency" .=) <$>
                    _crMaximumExecutionFrequency,
                  ("ConfigRuleId" .=) <$> _crConfigRuleId,
                  ("Scope" .=) <$> _crScope,
                  ("ConfigRuleState" .=) <$> _crConfigRuleState,
                  ("Description" .=) <$> _crDescription,
                  ("ConfigRuleArn" .=) <$> _crConfigRuleARN,
                  Just ("Source" .= _crSource)])

-- | Status information for your AWS managed Config rules. The status
-- includes information such as the last time the rule ran, the last time
-- it failed, and the related error for the last failure.
--
-- This action does not return status information about customer managed
-- Config rules.
--
-- /See:/ 'configRuleEvaluationStatus' smart constructor.
data ConfigRuleEvaluationStatus = ConfigRuleEvaluationStatus'
    { _cresLastErrorCode                :: !(Maybe Text)
    , _cresFirstActivatedTime           :: !(Maybe POSIX)
    , _cresConfigRuleName               :: !(Maybe Text)
    , _cresLastErrorMessage             :: !(Maybe Text)
    , _cresConfigRuleId                 :: !(Maybe Text)
    , _cresLastFailedInvocationTime     :: !(Maybe POSIX)
    , _cresLastSuccessfulInvocationTime :: !(Maybe POSIX)
    , _cresConfigRuleARN                :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigRuleEvaluationStatus' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cresLastErrorCode'
--
-- * 'cresFirstActivatedTime'
--
-- * 'cresConfigRuleName'
--
-- * 'cresLastErrorMessage'
--
-- * 'cresConfigRuleId'
--
-- * 'cresLastFailedInvocationTime'
--
-- * 'cresLastSuccessfulInvocationTime'
--
-- * 'cresConfigRuleARN'
configRuleEvaluationStatus
    :: ConfigRuleEvaluationStatus
configRuleEvaluationStatus =
    ConfigRuleEvaluationStatus'
    { _cresLastErrorCode = Nothing
    , _cresFirstActivatedTime = Nothing
    , _cresConfigRuleName = Nothing
    , _cresLastErrorMessage = Nothing
    , _cresConfigRuleId = Nothing
    , _cresLastFailedInvocationTime = Nothing
    , _cresLastSuccessfulInvocationTime = Nothing
    , _cresConfigRuleARN = Nothing
    }

-- | The error code that AWS Config returned when the rule last failed.
cresLastErrorCode :: Lens' ConfigRuleEvaluationStatus (Maybe Text)
cresLastErrorCode = lens _cresLastErrorCode (\ s a -> s{_cresLastErrorCode = a});

-- | The time that you first activated the AWS Config rule.
cresFirstActivatedTime :: Lens' ConfigRuleEvaluationStatus (Maybe UTCTime)
cresFirstActivatedTime = lens _cresFirstActivatedTime (\ s a -> s{_cresFirstActivatedTime = a}) . mapping _Time;

-- | The name of the AWS Config rule.
cresConfigRuleName :: Lens' ConfigRuleEvaluationStatus (Maybe Text)
cresConfigRuleName = lens _cresConfigRuleName (\ s a -> s{_cresConfigRuleName = a});

-- | The error message that AWS Config returned when the rule last failed.
cresLastErrorMessage :: Lens' ConfigRuleEvaluationStatus (Maybe Text)
cresLastErrorMessage = lens _cresLastErrorMessage (\ s a -> s{_cresLastErrorMessage = a});

-- | The ID of the AWS Config rule.
cresConfigRuleId :: Lens' ConfigRuleEvaluationStatus (Maybe Text)
cresConfigRuleId = lens _cresConfigRuleId (\ s a -> s{_cresConfigRuleId = a});

-- | The time that AWS Config last failed to invoke the AWS Config rule to
-- evaluate your AWS resources.
cresLastFailedInvocationTime :: Lens' ConfigRuleEvaluationStatus (Maybe UTCTime)
cresLastFailedInvocationTime = lens _cresLastFailedInvocationTime (\ s a -> s{_cresLastFailedInvocationTime = a}) . mapping _Time;

-- | The time that AWS Config last successfully invoked the AWS Config rule
-- to evaluate your AWS resources.
cresLastSuccessfulInvocationTime :: Lens' ConfigRuleEvaluationStatus (Maybe UTCTime)
cresLastSuccessfulInvocationTime = lens _cresLastSuccessfulInvocationTime (\ s a -> s{_cresLastSuccessfulInvocationTime = a}) . mapping _Time;

-- | The Amazon Resource Name (ARN) of the AWS Config rule.
cresConfigRuleARN :: Lens' ConfigRuleEvaluationStatus (Maybe Text)
cresConfigRuleARN = lens _cresConfigRuleARN (\ s a -> s{_cresConfigRuleARN = a});

instance FromJSON ConfigRuleEvaluationStatus where
        parseJSON
          = withObject "ConfigRuleEvaluationStatus"
              (\ x ->
                 ConfigRuleEvaluationStatus' <$>
                   (x .:? "LastErrorCode") <*>
                     (x .:? "FirstActivatedTime")
                     <*> (x .:? "ConfigRuleName")
                     <*> (x .:? "LastErrorMessage")
                     <*> (x .:? "ConfigRuleId")
                     <*> (x .:? "LastFailedInvocationTime")
                     <*> (x .:? "LastSuccessfulInvocationTime")
                     <*> (x .:? "ConfigRuleArn"))

-- | Options for how AWS Config delivers configuration snapshots to the
-- Amazon S3 bucket in your delivery channel.
--
-- /See:/ 'configSnapshotDeliveryProperties' smart constructor.
newtype ConfigSnapshotDeliveryProperties = ConfigSnapshotDeliveryProperties'
    { _csdpDeliveryFrequency :: Maybe MaximumExecutionFrequency
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigSnapshotDeliveryProperties' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csdpDeliveryFrequency'
configSnapshotDeliveryProperties
    :: ConfigSnapshotDeliveryProperties
configSnapshotDeliveryProperties =
    ConfigSnapshotDeliveryProperties'
    { _csdpDeliveryFrequency = Nothing
    }

-- | The frequency with which a AWS Config recurringly delivers configuration
-- snapshots.
csdpDeliveryFrequency :: Lens' ConfigSnapshotDeliveryProperties (Maybe MaximumExecutionFrequency)
csdpDeliveryFrequency = lens _csdpDeliveryFrequency (\ s a -> s{_csdpDeliveryFrequency = a});

instance FromJSON ConfigSnapshotDeliveryProperties
         where
        parseJSON
          = withObject "ConfigSnapshotDeliveryProperties"
              (\ x ->
                 ConfigSnapshotDeliveryProperties' <$>
                   (x .:? "deliveryFrequency"))

instance ToJSON ConfigSnapshotDeliveryProperties
         where
        toJSON ConfigSnapshotDeliveryProperties'{..}
          = object
              (catMaybes
                 [("deliveryFrequency" .=) <$>
                    _csdpDeliveryFrequency])

-- | A list that contains the status of the delivery of the configuration
-- stream notification to the Amazon SNS topic.
--
-- /See:/ 'configStreamDeliveryInfo' smart constructor.
data ConfigStreamDeliveryInfo = ConfigStreamDeliveryInfo'
    { _csdiLastErrorCode        :: !(Maybe Text)
    , _csdiLastStatusChangeTime :: !(Maybe POSIX)
    , _csdiLastStatus           :: !(Maybe DeliveryStatus)
    , _csdiLastErrorMessage     :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigStreamDeliveryInfo' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csdiLastErrorCode'
--
-- * 'csdiLastStatusChangeTime'
--
-- * 'csdiLastStatus'
--
-- * 'csdiLastErrorMessage'
configStreamDeliveryInfo
    :: ConfigStreamDeliveryInfo
configStreamDeliveryInfo =
    ConfigStreamDeliveryInfo'
    { _csdiLastErrorCode = Nothing
    , _csdiLastStatusChangeTime = Nothing
    , _csdiLastStatus = Nothing
    , _csdiLastErrorMessage = Nothing
    }

-- | The error code from the last attempted delivery.
csdiLastErrorCode :: Lens' ConfigStreamDeliveryInfo (Maybe Text)
csdiLastErrorCode = lens _csdiLastErrorCode (\ s a -> s{_csdiLastErrorCode = a});

-- | The time from the last status change.
csdiLastStatusChangeTime :: Lens' ConfigStreamDeliveryInfo (Maybe UTCTime)
csdiLastStatusChangeTime = lens _csdiLastStatusChangeTime (\ s a -> s{_csdiLastStatusChangeTime = a}) . mapping _Time;

-- | Status of the last attempted delivery.
--
-- __Note__ Providing an SNS topic on a
-- <http://docs.aws.amazon.com/config/latest/APIReference/API_DeliveryChannel.html DeliveryChannel>
-- for AWS Config is optional. If the SNS delivery is turned off, the last
-- status will be __Not_Applicable__.
csdiLastStatus :: Lens' ConfigStreamDeliveryInfo (Maybe DeliveryStatus)
csdiLastStatus = lens _csdiLastStatus (\ s a -> s{_csdiLastStatus = a});

-- | The error message from the last attempted delivery.
csdiLastErrorMessage :: Lens' ConfigStreamDeliveryInfo (Maybe Text)
csdiLastErrorMessage = lens _csdiLastErrorMessage (\ s a -> s{_csdiLastErrorMessage = a});

instance FromJSON ConfigStreamDeliveryInfo where
        parseJSON
          = withObject "ConfigStreamDeliveryInfo"
              (\ x ->
                 ConfigStreamDeliveryInfo' <$>
                   (x .:? "lastErrorCode") <*>
                     (x .:? "lastStatusChangeTime")
                     <*> (x .:? "lastStatus")
                     <*> (x .:? "lastErrorMessage"))

-- | A list that contains detailed configurations of a specified resource.
--
-- Currently, the list does not contain information about non-AWS
-- components (for example, applications on your Amazon EC2 instances).
--
-- /See:/ 'configurationItem' smart constructor.
data ConfigurationItem = ConfigurationItem'
    { _ciResourceId                   :: !(Maybe Text)
    , _ciResourceType                 :: !(Maybe ResourceType)
    , _ciConfigurationStateId         :: !(Maybe Text)
    , _ciArn                          :: !(Maybe Text)
    , _ciResourceName                 :: !(Maybe Text)
    , _ciResourceCreationTime         :: !(Maybe POSIX)
    , _ciConfigurationItemStatus      :: !(Maybe ConfigurationItemStatus)
    , _ciConfigurationItemCaptureTime :: !(Maybe POSIX)
    , _ciAccountId                    :: !(Maybe Text)
    , _ciAvailabilityZone             :: !(Maybe Text)
    , _ciRelationships                :: !(Maybe [Relationship])
    , _ciVersion                      :: !(Maybe Text)
    , _ciAwsRegion                    :: !(Maybe Text)
    , _ciRelatedEvents                :: !(Maybe [Text])
    , _ciConfiguration                :: !(Maybe Text)
    , _ciConfigurationItemMD5Hash     :: !(Maybe Text)
    , _ciTags                         :: !(Maybe (Map Text Text))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigurationItem' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ciResourceId'
--
-- * 'ciResourceType'
--
-- * 'ciConfigurationStateId'
--
-- * 'ciArn'
--
-- * 'ciResourceName'
--
-- * 'ciResourceCreationTime'
--
-- * 'ciConfigurationItemStatus'
--
-- * 'ciConfigurationItemCaptureTime'
--
-- * 'ciAccountId'
--
-- * 'ciAvailabilityZone'
--
-- * 'ciRelationships'
--
-- * 'ciVersion'
--
-- * 'ciAwsRegion'
--
-- * 'ciRelatedEvents'
--
-- * 'ciConfiguration'
--
-- * 'ciConfigurationItemMD5Hash'
--
-- * 'ciTags'
configurationItem
    :: ConfigurationItem
configurationItem =
    ConfigurationItem'
    { _ciResourceId = Nothing
    , _ciResourceType = Nothing
    , _ciConfigurationStateId = Nothing
    , _ciArn = Nothing
    , _ciResourceName = Nothing
    , _ciResourceCreationTime = Nothing
    , _ciConfigurationItemStatus = Nothing
    , _ciConfigurationItemCaptureTime = Nothing
    , _ciAccountId = Nothing
    , _ciAvailabilityZone = Nothing
    , _ciRelationships = Nothing
    , _ciVersion = Nothing
    , _ciAwsRegion = Nothing
    , _ciRelatedEvents = Nothing
    , _ciConfiguration = Nothing
    , _ciConfigurationItemMD5Hash = Nothing
    , _ciTags = Nothing
    }

-- | The ID of the resource (for example., 'sg-xxxxxx').
ciResourceId :: Lens' ConfigurationItem (Maybe Text)
ciResourceId = lens _ciResourceId (\ s a -> s{_ciResourceId = a});

-- | The type of AWS resource.
ciResourceType :: Lens' ConfigurationItem (Maybe ResourceType)
ciResourceType = lens _ciResourceType (\ s a -> s{_ciResourceType = a});

-- | An identifier that indicates the ordering of the configuration items of
-- a resource.
ciConfigurationStateId :: Lens' ConfigurationItem (Maybe Text)
ciConfigurationStateId = lens _ciConfigurationStateId (\ s a -> s{_ciConfigurationStateId = a});

-- | The Amazon Resource Name (ARN) of the resource.
ciArn :: Lens' ConfigurationItem (Maybe Text)
ciArn = lens _ciArn (\ s a -> s{_ciArn = a});

-- | The custom name of the resource, if available.
ciResourceName :: Lens' ConfigurationItem (Maybe Text)
ciResourceName = lens _ciResourceName (\ s a -> s{_ciResourceName = a});

-- | The time stamp when the resource was created.
ciResourceCreationTime :: Lens' ConfigurationItem (Maybe UTCTime)
ciResourceCreationTime = lens _ciResourceCreationTime (\ s a -> s{_ciResourceCreationTime = a}) . mapping _Time;

-- | The configuration item status.
ciConfigurationItemStatus :: Lens' ConfigurationItem (Maybe ConfigurationItemStatus)
ciConfigurationItemStatus = lens _ciConfigurationItemStatus (\ s a -> s{_ciConfigurationItemStatus = a});

-- | The time when the configuration recording was initiated.
ciConfigurationItemCaptureTime :: Lens' ConfigurationItem (Maybe UTCTime)
ciConfigurationItemCaptureTime = lens _ciConfigurationItemCaptureTime (\ s a -> s{_ciConfigurationItemCaptureTime = a}) . mapping _Time;

-- | The 12 digit AWS account ID associated with the resource.
ciAccountId :: Lens' ConfigurationItem (Maybe Text)
ciAccountId = lens _ciAccountId (\ s a -> s{_ciAccountId = a});

-- | The Availability Zone associated with the resource.
ciAvailabilityZone :: Lens' ConfigurationItem (Maybe Text)
ciAvailabilityZone = lens _ciAvailabilityZone (\ s a -> s{_ciAvailabilityZone = a});

-- | A list of related AWS resources.
ciRelationships :: Lens' ConfigurationItem [Relationship]
ciRelationships = lens _ciRelationships (\ s a -> s{_ciRelationships = a}) . _Default . _Coerce;

-- | The version number of the resource configuration.
ciVersion :: Lens' ConfigurationItem (Maybe Text)
ciVersion = lens _ciVersion (\ s a -> s{_ciVersion = a});

-- | The region where the resource resides.
ciAwsRegion :: Lens' ConfigurationItem (Maybe Text)
ciAwsRegion = lens _ciAwsRegion (\ s a -> s{_ciAwsRegion = a});

-- | A list of CloudTrail event IDs.
--
-- A populated field indicates that the current configuration was initiated
-- by the events recorded in the CloudTrail log. For more information about
-- CloudTrail, see
-- <http://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html What is AWS CloudTrail?>.
--
-- An empty field indicates that the current configuration was not
-- initiated by any event.
ciRelatedEvents :: Lens' ConfigurationItem [Text]
ciRelatedEvents = lens _ciRelatedEvents (\ s a -> s{_ciRelatedEvents = a}) . _Default . _Coerce;

-- | The description of the resource configuration.
ciConfiguration :: Lens' ConfigurationItem (Maybe Text)
ciConfiguration = lens _ciConfiguration (\ s a -> s{_ciConfiguration = a});

-- | Unique MD5 hash that represents the configuration item\'s state.
--
-- You can use MD5 hash to compare the states of two or more configuration
-- items that are associated with the same resource.
ciConfigurationItemMD5Hash :: Lens' ConfigurationItem (Maybe Text)
ciConfigurationItemMD5Hash = lens _ciConfigurationItemMD5Hash (\ s a -> s{_ciConfigurationItemMD5Hash = a});

-- | A mapping of key value tags associated with the resource.
ciTags :: Lens' ConfigurationItem (HashMap Text Text)
ciTags = lens _ciTags (\ s a -> s{_ciTags = a}) . _Default . _Map;

instance FromJSON ConfigurationItem where
        parseJSON
          = withObject "ConfigurationItem"
              (\ x ->
                 ConfigurationItem' <$>
                   (x .:? "resourceId") <*> (x .:? "resourceType") <*>
                     (x .:? "configurationStateId")
                     <*> (x .:? "arn")
                     <*> (x .:? "resourceName")
                     <*> (x .:? "resourceCreationTime")
                     <*> (x .:? "configurationItemStatus")
                     <*> (x .:? "configurationItemCaptureTime")
                     <*> (x .:? "accountId")
                     <*> (x .:? "availabilityZone")
                     <*> (x .:? "relationships" .!= mempty)
                     <*> (x .:? "version")
                     <*> (x .:? "awsRegion")
                     <*> (x .:? "relatedEvents" .!= mempty)
                     <*> (x .:? "configuration")
                     <*> (x .:? "configurationItemMD5Hash")
                     <*> (x .:? "tags" .!= mempty))

-- | An object that represents the recording of configuration changes of an
-- AWS resource.
--
-- /See:/ 'configurationRecorder' smart constructor.
data ConfigurationRecorder = ConfigurationRecorder'
    { _crName           :: !(Maybe Text)
    , _crRecordingGroup :: !(Maybe RecordingGroup)
    , _crRoleARN        :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigurationRecorder' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crName'
--
-- * 'crRecordingGroup'
--
-- * 'crRoleARN'
configurationRecorder
    :: ConfigurationRecorder
configurationRecorder =
    ConfigurationRecorder'
    { _crName = Nothing
    , _crRecordingGroup = Nothing
    , _crRoleARN = Nothing
    }

-- | The name of the recorder. By default, AWS Config automatically assigns
-- the name \"default\" when creating the configuration recorder. You
-- cannot change the assigned name.
crName :: Lens' ConfigurationRecorder (Maybe Text)
crName = lens _crName (\ s a -> s{_crName = a});

-- | The recording group specifies either to record configurations for all
-- supported resources or to provide a list of resource types to record.
-- The list of resource types must be a subset of supported resource types.
crRecordingGroup :: Lens' ConfigurationRecorder (Maybe RecordingGroup)
crRecordingGroup = lens _crRecordingGroup (\ s a -> s{_crRecordingGroup = a});

-- | Amazon Resource Name (ARN) of the IAM role used to describe the AWS
-- resources associated with the account.
crRoleARN :: Lens' ConfigurationRecorder (Maybe Text)
crRoleARN = lens _crRoleARN (\ s a -> s{_crRoleARN = a});

instance FromJSON ConfigurationRecorder where
        parseJSON
          = withObject "ConfigurationRecorder"
              (\ x ->
                 ConfigurationRecorder' <$>
                   (x .:? "name") <*> (x .:? "recordingGroup") <*>
                     (x .:? "roleARN"))

instance ToJSON ConfigurationRecorder where
        toJSON ConfigurationRecorder'{..}
          = object
              (catMaybes
                 [("name" .=) <$> _crName,
                  ("recordingGroup" .=) <$> _crRecordingGroup,
                  ("roleARN" .=) <$> _crRoleARN])

-- | The current status of the configuration recorder.
--
-- /See:/ 'configurationRecorderStatus' smart constructor.
data ConfigurationRecorderStatus = ConfigurationRecorderStatus'
    { _crsLastErrorCode        :: !(Maybe Text)
    , _crsLastStopTime         :: !(Maybe POSIX)
    , _crsLastStatusChangeTime :: !(Maybe POSIX)
    , _crsRecording            :: !(Maybe Bool)
    , _crsLastStatus           :: !(Maybe RecorderStatus)
    , _crsLastErrorMessage     :: !(Maybe Text)
    , _crsName                 :: !(Maybe Text)
    , _crsLastStartTime        :: !(Maybe POSIX)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConfigurationRecorderStatus' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crsLastErrorCode'
--
-- * 'crsLastStopTime'
--
-- * 'crsLastStatusChangeTime'
--
-- * 'crsRecording'
--
-- * 'crsLastStatus'
--
-- * 'crsLastErrorMessage'
--
-- * 'crsName'
--
-- * 'crsLastStartTime'
configurationRecorderStatus
    :: ConfigurationRecorderStatus
configurationRecorderStatus =
    ConfigurationRecorderStatus'
    { _crsLastErrorCode = Nothing
    , _crsLastStopTime = Nothing
    , _crsLastStatusChangeTime = Nothing
    , _crsRecording = Nothing
    , _crsLastStatus = Nothing
    , _crsLastErrorMessage = Nothing
    , _crsName = Nothing
    , _crsLastStartTime = Nothing
    }

-- | The error code indicating that the recording failed.
crsLastErrorCode :: Lens' ConfigurationRecorderStatus (Maybe Text)
crsLastErrorCode = lens _crsLastErrorCode (\ s a -> s{_crsLastErrorCode = a});

-- | The time the recorder was last stopped.
crsLastStopTime :: Lens' ConfigurationRecorderStatus (Maybe UTCTime)
crsLastStopTime = lens _crsLastStopTime (\ s a -> s{_crsLastStopTime = a}) . mapping _Time;

-- | The time when the status was last changed.
crsLastStatusChangeTime :: Lens' ConfigurationRecorderStatus (Maybe UTCTime)
crsLastStatusChangeTime = lens _crsLastStatusChangeTime (\ s a -> s{_crsLastStatusChangeTime = a}) . mapping _Time;

-- | Specifies whether the recorder is currently recording or not.
crsRecording :: Lens' ConfigurationRecorderStatus (Maybe Bool)
crsRecording = lens _crsRecording (\ s a -> s{_crsRecording = a});

-- | The last (previous) status of the recorder.
crsLastStatus :: Lens' ConfigurationRecorderStatus (Maybe RecorderStatus)
crsLastStatus = lens _crsLastStatus (\ s a -> s{_crsLastStatus = a});

-- | The message indicating that the recording failed due to an error.
crsLastErrorMessage :: Lens' ConfigurationRecorderStatus (Maybe Text)
crsLastErrorMessage = lens _crsLastErrorMessage (\ s a -> s{_crsLastErrorMessage = a});

-- | The name of the configuration recorder.
crsName :: Lens' ConfigurationRecorderStatus (Maybe Text)
crsName = lens _crsName (\ s a -> s{_crsName = a});

-- | The time the recorder was last started.
crsLastStartTime :: Lens' ConfigurationRecorderStatus (Maybe UTCTime)
crsLastStartTime = lens _crsLastStartTime (\ s a -> s{_crsLastStartTime = a}) . mapping _Time;

instance FromJSON ConfigurationRecorderStatus where
        parseJSON
          = withObject "ConfigurationRecorderStatus"
              (\ x ->
                 ConfigurationRecorderStatus' <$>
                   (x .:? "lastErrorCode") <*> (x .:? "lastStopTime")
                     <*> (x .:? "lastStatusChangeTime")
                     <*> (x .:? "recording")
                     <*> (x .:? "lastStatus")
                     <*> (x .:? "lastErrorMessage")
                     <*> (x .:? "name")
                     <*> (x .:? "lastStartTime"))

-- | A logical container used for storing the configuration changes of an AWS
-- resource.
--
-- /See:/ 'deliveryChannel' smart constructor.
data DeliveryChannel = DeliveryChannel'
    { _dcS3KeyPrefix                      :: !(Maybe Text)
    , _dcSnsTopicARN                      :: !(Maybe Text)
    , _dcName                             :: !(Maybe Text)
    , _dcConfigSnapshotDeliveryProperties :: !(Maybe ConfigSnapshotDeliveryProperties)
    , _dcS3BucketName                     :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeliveryChannel' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcS3KeyPrefix'
--
-- * 'dcSnsTopicARN'
--
-- * 'dcName'
--
-- * 'dcConfigSnapshotDeliveryProperties'
--
-- * 'dcS3BucketName'
deliveryChannel
    :: DeliveryChannel
deliveryChannel =
    DeliveryChannel'
    { _dcS3KeyPrefix = Nothing
    , _dcSnsTopicARN = Nothing
    , _dcName = Nothing
    , _dcConfigSnapshotDeliveryProperties = Nothing
    , _dcS3BucketName = Nothing
    }

-- | The prefix for the specified Amazon S3 bucket.
dcS3KeyPrefix :: Lens' DeliveryChannel (Maybe Text)
dcS3KeyPrefix = lens _dcS3KeyPrefix (\ s a -> s{_dcS3KeyPrefix = a});

-- | The Amazon Resource Name (ARN) of the SNS topic that AWS Config delivers
-- notifications to.
dcSnsTopicARN :: Lens' DeliveryChannel (Maybe Text)
dcSnsTopicARN = lens _dcSnsTopicARN (\ s a -> s{_dcSnsTopicARN = a});

-- | The name of the delivery channel. By default, AWS Config automatically
-- assigns the name \"default\" when creating the delivery channel. You
-- cannot change the assigned name.
dcName :: Lens' DeliveryChannel (Maybe Text)
dcName = lens _dcName (\ s a -> s{_dcName = a});

-- | Undocumented member.
dcConfigSnapshotDeliveryProperties :: Lens' DeliveryChannel (Maybe ConfigSnapshotDeliveryProperties)
dcConfigSnapshotDeliveryProperties = lens _dcConfigSnapshotDeliveryProperties (\ s a -> s{_dcConfigSnapshotDeliveryProperties = a});

-- | The name of the Amazon S3 bucket used to store configuration history for
-- the delivery channel.
dcS3BucketName :: Lens' DeliveryChannel (Maybe Text)
dcS3BucketName = lens _dcS3BucketName (\ s a -> s{_dcS3BucketName = a});

instance FromJSON DeliveryChannel where
        parseJSON
          = withObject "DeliveryChannel"
              (\ x ->
                 DeliveryChannel' <$>
                   (x .:? "s3KeyPrefix") <*> (x .:? "snsTopicARN") <*>
                     (x .:? "name")
                     <*> (x .:? "configSnapshotDeliveryProperties")
                     <*> (x .:? "s3BucketName"))

instance ToJSON DeliveryChannel where
        toJSON DeliveryChannel'{..}
          = object
              (catMaybes
                 [("s3KeyPrefix" .=) <$> _dcS3KeyPrefix,
                  ("snsTopicARN" .=) <$> _dcSnsTopicARN,
                  ("name" .=) <$> _dcName,
                  ("configSnapshotDeliveryProperties" .=) <$>
                    _dcConfigSnapshotDeliveryProperties,
                  ("s3BucketName" .=) <$> _dcS3BucketName])

-- | The status of a specified delivery channel.
--
-- Valid values: 'Success' | 'Failure'
--
-- /See:/ 'deliveryChannelStatus' smart constructor.
data DeliveryChannelStatus = DeliveryChannelStatus'
    { _dcsConfigSnapshotDeliveryInfo :: !(Maybe ConfigExportDeliveryInfo)
    , _dcsConfigStreamDeliveryInfo   :: !(Maybe ConfigStreamDeliveryInfo)
    , _dcsConfigHistoryDeliveryInfo  :: !(Maybe ConfigExportDeliveryInfo)
    , _dcsName                       :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeliveryChannelStatus' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcsConfigSnapshotDeliveryInfo'
--
-- * 'dcsConfigStreamDeliveryInfo'
--
-- * 'dcsConfigHistoryDeliveryInfo'
--
-- * 'dcsName'
deliveryChannelStatus
    :: DeliveryChannelStatus
deliveryChannelStatus =
    DeliveryChannelStatus'
    { _dcsConfigSnapshotDeliveryInfo = Nothing
    , _dcsConfigStreamDeliveryInfo = Nothing
    , _dcsConfigHistoryDeliveryInfo = Nothing
    , _dcsName = Nothing
    }

-- | A list containing the status of the delivery of the snapshot to the
-- specified Amazon S3 bucket.
dcsConfigSnapshotDeliveryInfo :: Lens' DeliveryChannelStatus (Maybe ConfigExportDeliveryInfo)
dcsConfigSnapshotDeliveryInfo = lens _dcsConfigSnapshotDeliveryInfo (\ s a -> s{_dcsConfigSnapshotDeliveryInfo = a});

-- | A list containing the status of the delivery of the configuration stream
-- notification to the specified Amazon SNS topic.
dcsConfigStreamDeliveryInfo :: Lens' DeliveryChannelStatus (Maybe ConfigStreamDeliveryInfo)
dcsConfigStreamDeliveryInfo = lens _dcsConfigStreamDeliveryInfo (\ s a -> s{_dcsConfigStreamDeliveryInfo = a});

-- | A list that contains the status of the delivery of the configuration
-- history to the specified Amazon S3 bucket.
dcsConfigHistoryDeliveryInfo :: Lens' DeliveryChannelStatus (Maybe ConfigExportDeliveryInfo)
dcsConfigHistoryDeliveryInfo = lens _dcsConfigHistoryDeliveryInfo (\ s a -> s{_dcsConfigHistoryDeliveryInfo = a});

-- | The name of the delivery channel.
dcsName :: Lens' DeliveryChannelStatus (Maybe Text)
dcsName = lens _dcsName (\ s a -> s{_dcsName = a});

instance FromJSON DeliveryChannelStatus where
        parseJSON
          = withObject "DeliveryChannelStatus"
              (\ x ->
                 DeliveryChannelStatus' <$>
                   (x .:? "configSnapshotDeliveryInfo") <*>
                     (x .:? "configStreamDeliveryInfo")
                     <*> (x .:? "configHistoryDeliveryInfo")
                     <*> (x .:? "name"))

-- | Identifies an AWS resource and indicates whether it complies with the
-- AWS Config rule that it was evaluated against.
--
-- /See:/ 'evaluation' smart constructor.
data Evaluation = Evaluation'
    { _eAnnotation             :: !(Maybe Text)
    , _eComplianceResourceType :: !Text
    , _eComplianceResourceId   :: !Text
    , _eComplianceType         :: !ComplianceType
    , _eOrderingTimestamp      :: !POSIX
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Evaluation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eAnnotation'
--
-- * 'eComplianceResourceType'
--
-- * 'eComplianceResourceId'
--
-- * 'eComplianceType'
--
-- * 'eOrderingTimestamp'
evaluation
    :: Text -- ^ 'eComplianceResourceType'
    -> Text -- ^ 'eComplianceResourceId'
    -> ComplianceType -- ^ 'eComplianceType'
    -> UTCTime -- ^ 'eOrderingTimestamp'
    -> Evaluation
evaluation pComplianceResourceType_ pComplianceResourceId_ pComplianceType_ pOrderingTimestamp_ =
    Evaluation'
    { _eAnnotation = Nothing
    , _eComplianceResourceType = pComplianceResourceType_
    , _eComplianceResourceId = pComplianceResourceId_
    , _eComplianceType = pComplianceType_
    , _eOrderingTimestamp = _Time # pOrderingTimestamp_
    }

-- | Supplementary information about how the evaluation determined the
-- compliance.
eAnnotation :: Lens' Evaluation (Maybe Text)
eAnnotation = lens _eAnnotation (\ s a -> s{_eAnnotation = a});

-- | The type of AWS resource that was evaluated.
eComplianceResourceType :: Lens' Evaluation Text
eComplianceResourceType = lens _eComplianceResourceType (\ s a -> s{_eComplianceResourceType = a});

-- | The ID of the AWS resource that was evaluated.
eComplianceResourceId :: Lens' Evaluation Text
eComplianceResourceId = lens _eComplianceResourceId (\ s a -> s{_eComplianceResourceId = a});

-- | Indicates whether the AWS resource complies with the AWS Config rule
-- that it was evaluated against.
eComplianceType :: Lens' Evaluation ComplianceType
eComplianceType = lens _eComplianceType (\ s a -> s{_eComplianceType = a});

-- | The time of the event in AWS Config that triggered the evaluation. For
-- event-based evaluations, the time indicates when AWS Config created the
-- configuration item that triggered the evaluation. For periodic
-- evaluations, the time indicates when AWS Config delivered the
-- configuration snapshot that triggered the evaluation.
eOrderingTimestamp :: Lens' Evaluation UTCTime
eOrderingTimestamp = lens _eOrderingTimestamp (\ s a -> s{_eOrderingTimestamp = a}) . _Time;

instance FromJSON Evaluation where
        parseJSON
          = withObject "Evaluation"
              (\ x ->
                 Evaluation' <$>
                   (x .:? "Annotation") <*>
                     (x .: "ComplianceResourceType")
                     <*> (x .: "ComplianceResourceId")
                     <*> (x .: "ComplianceType")
                     <*> (x .: "OrderingTimestamp"))

instance ToJSON Evaluation where
        toJSON Evaluation'{..}
          = object
              (catMaybes
                 [("Annotation" .=) <$> _eAnnotation,
                  Just
                    ("ComplianceResourceType" .=
                       _eComplianceResourceType),
                  Just
                    ("ComplianceResourceId" .= _eComplianceResourceId),
                  Just ("ComplianceType" .= _eComplianceType),
                  Just ("OrderingTimestamp" .= _eOrderingTimestamp)])

-- | The details of an AWS Config evaluation. Provides the AWS resource that
-- was evaluated, the compliance of the resource, related timestamps, and
-- supplementary information.
--
-- /See:/ 'evaluationResult' smart constructor.
data EvaluationResult = EvaluationResult'
    { _erEvaluationResultIdentifier :: !(Maybe EvaluationResultIdentifier)
    , _erAnnotation                 :: !(Maybe Text)
    , _erConfigRuleInvokedTime      :: !(Maybe POSIX)
    , _erResultRecordedTime         :: !(Maybe POSIX)
    , _erResultToken                :: !(Maybe Text)
    , _erComplianceType             :: !(Maybe ComplianceType)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EvaluationResult' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'erEvaluationResultIdentifier'
--
-- * 'erAnnotation'
--
-- * 'erConfigRuleInvokedTime'
--
-- * 'erResultRecordedTime'
--
-- * 'erResultToken'
--
-- * 'erComplianceType'
evaluationResult
    :: EvaluationResult
evaluationResult =
    EvaluationResult'
    { _erEvaluationResultIdentifier = Nothing
    , _erAnnotation = Nothing
    , _erConfigRuleInvokedTime = Nothing
    , _erResultRecordedTime = Nothing
    , _erResultToken = Nothing
    , _erComplianceType = Nothing
    }

-- | Uniquely identifies the evaluation result.
erEvaluationResultIdentifier :: Lens' EvaluationResult (Maybe EvaluationResultIdentifier)
erEvaluationResultIdentifier = lens _erEvaluationResultIdentifier (\ s a -> s{_erEvaluationResultIdentifier = a});

-- | Supplementary information about how the evaluation determined the
-- compliance.
erAnnotation :: Lens' EvaluationResult (Maybe Text)
erAnnotation = lens _erAnnotation (\ s a -> s{_erAnnotation = a});

-- | The time when the AWS Config rule evaluated the AWS resource.
erConfigRuleInvokedTime :: Lens' EvaluationResult (Maybe UTCTime)
erConfigRuleInvokedTime = lens _erConfigRuleInvokedTime (\ s a -> s{_erConfigRuleInvokedTime = a}) . mapping _Time;

-- | The time when AWS Config recorded the evaluation result.
erResultRecordedTime :: Lens' EvaluationResult (Maybe UTCTime)
erResultRecordedTime = lens _erResultRecordedTime (\ s a -> s{_erResultRecordedTime = a}) . mapping _Time;

-- | An encrypted token that associates an evaluation with an AWS Config
-- rule. The token identifies the rule, the AWS resource being evaluated,
-- and the event that triggered the evaluation.
erResultToken :: Lens' EvaluationResult (Maybe Text)
erResultToken = lens _erResultToken (\ s a -> s{_erResultToken = a});

-- | Indicates whether the AWS resource complies with the AWS Config rule
-- that evaluated it.
erComplianceType :: Lens' EvaluationResult (Maybe ComplianceType)
erComplianceType = lens _erComplianceType (\ s a -> s{_erComplianceType = a});

instance FromJSON EvaluationResult where
        parseJSON
          = withObject "EvaluationResult"
              (\ x ->
                 EvaluationResult' <$>
                   (x .:? "EvaluationResultIdentifier") <*>
                     (x .:? "Annotation")
                     <*> (x .:? "ConfigRuleInvokedTime")
                     <*> (x .:? "ResultRecordedTime")
                     <*> (x .:? "ResultToken")
                     <*> (x .:? "ComplianceType"))

-- | Uniquely identifies an evaluation result.
--
-- /See:/ 'evaluationResultIdentifier' smart constructor.
data EvaluationResultIdentifier = EvaluationResultIdentifier'
    { _eriEvaluationResultQualifier :: !(Maybe EvaluationResultQualifier)
    , _eriOrderingTimestamp         :: !(Maybe POSIX)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EvaluationResultIdentifier' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eriEvaluationResultQualifier'
--
-- * 'eriOrderingTimestamp'
evaluationResultIdentifier
    :: EvaluationResultIdentifier
evaluationResultIdentifier =
    EvaluationResultIdentifier'
    { _eriEvaluationResultQualifier = Nothing
    , _eriOrderingTimestamp = Nothing
    }

-- | Identifies an AWS Config rule used to evaluate an AWS resource, and
-- provides the type and ID of the evaluated resource.
eriEvaluationResultQualifier :: Lens' EvaluationResultIdentifier (Maybe EvaluationResultQualifier)
eriEvaluationResultQualifier = lens _eriEvaluationResultQualifier (\ s a -> s{_eriEvaluationResultQualifier = a});

-- | The time of the event that triggered the evaluation of your AWS
-- resources. The time can indicate when AWS Config delivered a
-- configuration item change notification, or it can indicate when AWS
-- Config delivered the configuration snapshot, depending on which event
-- triggered the evaluation.
eriOrderingTimestamp :: Lens' EvaluationResultIdentifier (Maybe UTCTime)
eriOrderingTimestamp = lens _eriOrderingTimestamp (\ s a -> s{_eriOrderingTimestamp = a}) . mapping _Time;

instance FromJSON EvaluationResultIdentifier where
        parseJSON
          = withObject "EvaluationResultIdentifier"
              (\ x ->
                 EvaluationResultIdentifier' <$>
                   (x .:? "EvaluationResultQualifier") <*>
                     (x .:? "OrderingTimestamp"))

-- | Identifies an AWS Config rule that evaluated an AWS resource, and
-- provides the type and ID of the resource that the rule evaluated.
--
-- /See:/ 'evaluationResultQualifier' smart constructor.
data EvaluationResultQualifier = EvaluationResultQualifier'
    { _erqResourceId     :: !(Maybe Text)
    , _erqResourceType   :: !(Maybe Text)
    , _erqConfigRuleName :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EvaluationResultQualifier' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'erqResourceId'
--
-- * 'erqResourceType'
--
-- * 'erqConfigRuleName'
evaluationResultQualifier
    :: EvaluationResultQualifier
evaluationResultQualifier =
    EvaluationResultQualifier'
    { _erqResourceId = Nothing
    , _erqResourceType = Nothing
    , _erqConfigRuleName = Nothing
    }

-- | The ID of the evaluated AWS resource.
erqResourceId :: Lens' EvaluationResultQualifier (Maybe Text)
erqResourceId = lens _erqResourceId (\ s a -> s{_erqResourceId = a});

-- | The type of AWS resource that was evaluated.
erqResourceType :: Lens' EvaluationResultQualifier (Maybe Text)
erqResourceType = lens _erqResourceType (\ s a -> s{_erqResourceType = a});

-- | The name of the AWS Config rule that was used in the evaluation.
erqConfigRuleName :: Lens' EvaluationResultQualifier (Maybe Text)
erqConfigRuleName = lens _erqConfigRuleName (\ s a -> s{_erqConfigRuleName = a});

instance FromJSON EvaluationResultQualifier where
        parseJSON
          = withObject "EvaluationResultQualifier"
              (\ x ->
                 EvaluationResultQualifier' <$>
                   (x .:? "ResourceId") <*> (x .:? "ResourceType") <*>
                     (x .:? "ConfigRuleName"))

-- | The group of AWS resource types that AWS Config records when starting
-- the configuration recorder.
--
-- __recordingGroup__ can have one and only one parameter. Choose either
-- __allSupported__ or __resourceTypes__.
--
-- /See:/ 'recordingGroup' smart constructor.
data RecordingGroup = RecordingGroup'
    { _rgAllSupported  :: !(Maybe Bool)
    , _rgResourceTypes :: !(Maybe [ResourceType])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RecordingGroup' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rgAllSupported'
--
-- * 'rgResourceTypes'
recordingGroup
    :: RecordingGroup
recordingGroup =
    RecordingGroup'
    { _rgAllSupported = Nothing
    , _rgResourceTypes = Nothing
    }

-- | Records all supported resource types in the recording group. For a list
-- of supported resource types, see
-- <http://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources Supported resource types>.
-- If you specify __allSupported__, you cannot enumerate a list of
-- __resourceTypes__.
rgAllSupported :: Lens' RecordingGroup (Maybe Bool)
rgAllSupported = lens _rgAllSupported (\ s a -> s{_rgAllSupported = a});

-- | A comma-separated list of strings representing valid AWS resource types
-- (for example, 'AWS::EC2::Instance' or 'AWS::CloudTrail::Trail').
-- __resourceTypes__ is only valid if you have chosen not to select
-- __allSupported__. For a list of valid __resourceTypes__ values, see the
-- __resourceType Value__ column in the following topic:
-- <http://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources Supported AWS Resource Types>.
rgResourceTypes :: Lens' RecordingGroup [ResourceType]
rgResourceTypes = lens _rgResourceTypes (\ s a -> s{_rgResourceTypes = a}) . _Default . _Coerce;

instance FromJSON RecordingGroup where
        parseJSON
          = withObject "RecordingGroup"
              (\ x ->
                 RecordingGroup' <$>
                   (x .:? "allSupported") <*>
                     (x .:? "resourceTypes" .!= mempty))

instance ToJSON RecordingGroup where
        toJSON RecordingGroup'{..}
          = object
              (catMaybes
                 [("allSupported" .=) <$> _rgAllSupported,
                  ("resourceTypes" .=) <$> _rgResourceTypes])

-- | The relationship of the related resource to the main resource.
--
-- /See:/ 'relationship' smart constructor.
data Relationship = Relationship'
    { _rResourceId       :: !(Maybe Text)
    , _rResourceType     :: !(Maybe ResourceType)
    , _rResourceName     :: !(Maybe Text)
    , _rRelationshipName :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Relationship' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rResourceId'
--
-- * 'rResourceType'
--
-- * 'rResourceName'
--
-- * 'rRelationshipName'
relationship
    :: Relationship
relationship =
    Relationship'
    { _rResourceId = Nothing
    , _rResourceType = Nothing
    , _rResourceName = Nothing
    , _rRelationshipName = Nothing
    }

-- | The ID of the related resource (for example, 'sg-xxxxxx').
rResourceId :: Lens' Relationship (Maybe Text)
rResourceId = lens _rResourceId (\ s a -> s{_rResourceId = a});

-- | The resource type of the related resource.
rResourceType :: Lens' Relationship (Maybe ResourceType)
rResourceType = lens _rResourceType (\ s a -> s{_rResourceType = a});

-- | The custom name of the related resource, if available.
rResourceName :: Lens' Relationship (Maybe Text)
rResourceName = lens _rResourceName (\ s a -> s{_rResourceName = a});

-- | The type of relationship with the related resource.
rRelationshipName :: Lens' Relationship (Maybe Text)
rRelationshipName = lens _rRelationshipName (\ s a -> s{_rRelationshipName = a});

instance FromJSON Relationship where
        parseJSON
          = withObject "Relationship"
              (\ x ->
                 Relationship' <$>
                   (x .:? "resourceId") <*> (x .:? "resourceType") <*>
                     (x .:? "resourceName")
                     <*> (x .:? "relationshipName"))

-- | The details that identify a resource that is discovered by AWS Config,
-- including the resource type, ID, and (if available) the custom resource
-- name.
--
-- /See:/ 'resourceIdentifier' smart constructor.
data ResourceIdentifier = ResourceIdentifier'
    { _riResourceId           :: !(Maybe Text)
    , _riResourceType         :: !(Maybe ResourceType)
    , _riResourceName         :: !(Maybe Text)
    , _riResourceDeletionTime :: !(Maybe POSIX)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ResourceIdentifier' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'riResourceId'
--
-- * 'riResourceType'
--
-- * 'riResourceName'
--
-- * 'riResourceDeletionTime'
resourceIdentifier
    :: ResourceIdentifier
resourceIdentifier =
    ResourceIdentifier'
    { _riResourceId = Nothing
    , _riResourceType = Nothing
    , _riResourceName = Nothing
    , _riResourceDeletionTime = Nothing
    }

-- | The ID of the resource (for example., 'sg-xxxxxx').
riResourceId :: Lens' ResourceIdentifier (Maybe Text)
riResourceId = lens _riResourceId (\ s a -> s{_riResourceId = a});

-- | The type of resource.
riResourceType :: Lens' ResourceIdentifier (Maybe ResourceType)
riResourceType = lens _riResourceType (\ s a -> s{_riResourceType = a});

-- | The custom name of the resource (if available).
riResourceName :: Lens' ResourceIdentifier (Maybe Text)
riResourceName = lens _riResourceName (\ s a -> s{_riResourceName = a});

-- | The time that the resource was deleted.
riResourceDeletionTime :: Lens' ResourceIdentifier (Maybe UTCTime)
riResourceDeletionTime = lens _riResourceDeletionTime (\ s a -> s{_riResourceDeletionTime = a}) . mapping _Time;

instance FromJSON ResourceIdentifier where
        parseJSON
          = withObject "ResourceIdentifier"
              (\ x ->
                 ResourceIdentifier' <$>
                   (x .:? "resourceId") <*> (x .:? "resourceType") <*>
                     (x .:? "resourceName")
                     <*> (x .:? "resourceDeletionTime"))

-- | Defines which resources AWS Config evaluates against a rule. The scope
-- can include one or more resource types, a combination of a tag key and
-- value, or a combination of one resource type and one or more resource
-- IDs. Specify a scope to constrain the resources to be evaluated. If you
-- do not specify a scope, all resources in your recording group are
-- evaluated against the rule.
--
-- /See:/ 'scope' smart constructor.
data Scope = Scope'
    { _sComplianceResourceTypes :: !(Maybe [Text])
    , _sComplianceResourceId    :: !(Maybe Text)
    , _sTagValue                :: !(Maybe Text)
    , _sTagKey                  :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Scope' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sComplianceResourceTypes'
--
-- * 'sComplianceResourceId'
--
-- * 'sTagValue'
--
-- * 'sTagKey'
scope
    :: Scope
scope =
    Scope'
    { _sComplianceResourceTypes = Nothing
    , _sComplianceResourceId = Nothing
    , _sTagValue = Nothing
    , _sTagKey = Nothing
    }

-- | The resource types of only those AWS resources that you want AWS Config
-- to evaluate against the rule. You can specify only one type if you also
-- specify resource IDs for 'ComplianceResourceId'.
sComplianceResourceTypes :: Lens' Scope [Text]
sComplianceResourceTypes = lens _sComplianceResourceTypes (\ s a -> s{_sComplianceResourceTypes = a}) . _Default . _Coerce;

-- | The IDs of only those AWS resources that you want AWS Config to evaluate
-- against the rule. If you specify a resource ID, you must specify one
-- resource type for 'ComplianceResourceTypes'.
sComplianceResourceId :: Lens' Scope (Maybe Text)
sComplianceResourceId = lens _sComplianceResourceId (\ s a -> s{_sComplianceResourceId = a});

-- | The tag value applied to only those AWS resources that you want AWS
-- Config to evaluate against the rule. If you specify a value for
-- 'TagValue', you must also specify a value for 'TagKey'.
sTagValue :: Lens' Scope (Maybe Text)
sTagValue = lens _sTagValue (\ s a -> s{_sTagValue = a});

-- | The tag key that is applied to only those AWS resources that you want
-- AWS Config to evaluate against the rule.
sTagKey :: Lens' Scope (Maybe Text)
sTagKey = lens _sTagKey (\ s a -> s{_sTagKey = a});

instance FromJSON Scope where
        parseJSON
          = withObject "Scope"
              (\ x ->
                 Scope' <$>
                   (x .:? "ComplianceResourceTypes" .!= mempty) <*>
                     (x .:? "ComplianceResourceId")
                     <*> (x .:? "TagValue")
                     <*> (x .:? "TagKey"))

instance ToJSON Scope where
        toJSON Scope'{..}
          = object
              (catMaybes
                 [("ComplianceResourceTypes" .=) <$>
                    _sComplianceResourceTypes,
                  ("ComplianceResourceId" .=) <$>
                    _sComplianceResourceId,
                  ("TagValue" .=) <$> _sTagValue,
                  ("TagKey" .=) <$> _sTagKey])

-- | Provides the AWS Config rule owner (AWS or customer), the rule
-- identifier, and the events that trigger the evaluation of your AWS
-- resources.
--
-- /See:/ 'source' smart constructor.
data Source = Source'
    { _sSourceIdentifier :: !(Maybe Text)
    , _sOwner            :: !(Maybe Owner)
    , _sSourceDetails    :: !(Maybe [SourceDetail])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Source' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sSourceIdentifier'
--
-- * 'sOwner'
--
-- * 'sSourceDetails'
source
    :: Source
source =
    Source'
    { _sSourceIdentifier = Nothing
    , _sOwner = Nothing
    , _sSourceDetails = Nothing
    }

-- | For AWS managed Config rules, a pre-defined identifier from a list. To
-- reference the list, see
-- <http://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html Using AWS Managed Config Rules>.
--
-- For customer managed Config rules, the identifier is the Amazon Resource
-- Name (ARN) of the rule\'s AWS Lambda function.
sSourceIdentifier :: Lens' Source (Maybe Text)
sSourceIdentifier = lens _sSourceIdentifier (\ s a -> s{_sSourceIdentifier = a});

-- | Indicates whether AWS or the customer owns and manages the AWS Config
-- rule.
sOwner :: Lens' Source (Maybe Owner)
sOwner = lens _sOwner (\ s a -> s{_sOwner = a});

-- | Provides the source and type of the event that causes AWS Config to
-- evaluate your AWS resources.
sSourceDetails :: Lens' Source [SourceDetail]
sSourceDetails = lens _sSourceDetails (\ s a -> s{_sSourceDetails = a}) . _Default . _Coerce;

instance FromJSON Source where
        parseJSON
          = withObject "Source"
              (\ x ->
                 Source' <$>
                   (x .:? "SourceIdentifier") <*> (x .:? "Owner") <*>
                     (x .:? "SourceDetails" .!= mempty))

instance ToJSON Source where
        toJSON Source'{..}
          = object
              (catMaybes
                 [("SourceIdentifier" .=) <$> _sSourceIdentifier,
                  ("Owner" .=) <$> _sOwner,
                  ("SourceDetails" .=) <$> _sSourceDetails])

-- | Provides the source and type of the event that triggers AWS Config to
-- evaluate your AWS resources against a rule.
--
-- /See:/ 'sourceDetail' smart constructor.
data SourceDetail = SourceDetail'
    { _sdMessageType :: !(Maybe MessageType)
    , _sdEventSource :: !(Maybe EventSource)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'SourceDetail' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sdMessageType'
--
-- * 'sdEventSource'
sourceDetail
    :: SourceDetail
sourceDetail =
    SourceDetail'
    { _sdMessageType = Nothing
    , _sdEventSource = Nothing
    }

-- | The type of SNS message that triggers AWS Config to run an evaluation.
-- For evaluations that are initiated when AWS Config delivers a
-- configuration item change notification, you must use
-- 'ConfigurationItemChangeNotification'. For evaluations that are
-- initiated when AWS Config delivers a configuration snapshot, you must
-- use 'ConfigurationSnapshotDeliveryCompleted'.
sdMessageType :: Lens' SourceDetail (Maybe MessageType)
sdMessageType = lens _sdMessageType (\ s a -> s{_sdMessageType = a});

-- | The source of the event, such as an AWS service, that triggers AWS
-- Config to evaluate your AWS resources.
sdEventSource :: Lens' SourceDetail (Maybe EventSource)
sdEventSource = lens _sdEventSource (\ s a -> s{_sdEventSource = a});

instance FromJSON SourceDetail where
        parseJSON
          = withObject "SourceDetail"
              (\ x ->
                 SourceDetail' <$>
                   (x .:? "MessageType") <*> (x .:? "EventSource"))

instance ToJSON SourceDetail where
        toJSON SourceDetail'{..}
          = object
              (catMaybes
                 [("MessageType" .=) <$> _sdMessageType,
                  ("EventSource" .=) <$> _sdEventSource])
