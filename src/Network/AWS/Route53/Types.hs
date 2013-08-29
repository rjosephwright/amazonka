{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.Route53.Types
-- Copyright   : (c) 2013 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.Route53.Types where

import Data.Monoid
import Control.Applicative  ((<$>))
import Data.ByteString      (ByteString)
import Data.Time
import Network.AWS.Internal
import Text.Read

route53Version :: ByteString
route53Version = "2012-12-12"

route53NS :: ByteString
route53NS = "https://route53.amazonaws.com/doc/" <> route53Version <> "/"

route53Elem :: ByteString -> NName ByteString
route53Elem = mkNName route53NS

newtype CallerReference = CallerReference { unCallerReference :: ByteString }
    deriving (Eq, Ord, Show, Generic)

instance IsXML CallerReference where
    xmlPickler = (CallerReference, unCallerReference) `xpWrap` xpContent xpText

callerRef :: IO CallerReference
callerRef = CallerReference . toBS <$> getCurrentTime

data Protocol = HTTP | TCP
    deriving (Eq, Read, Show, Generic)

instance IsXML Protocol where
    xmlPickler = xpContent xpPrim

data RecordType = A | AAAA | CNAME | MX | NS | PTR | SOA | SPF | SRV | TXT
    deriving (Eq, Read, Show, Generic)

instance IsXML RecordType where
    xmlPickler = xpContent xpPrim

instance IsQuery RecordType

data Config = Config
    { cComment :: !ByteString
    } deriving (Eq, Show, Generic)

instance IsXML Config where
    xmlPickler = withNS route53NS

data HostedZone = HostedZone
    { hzId                     :: !ByteString
      -- ^ The ID of the hosted zone.
    , hzName                   :: !ByteString
      -- ^ The name of the domain. For resource record types that include a
      -- domain name, specify a fully qualified domain name, for example,
      -- www.example.com. The trailing dot is optional; Route 53 assumes
      -- that the domain name is fully qualified. This means that Route 53
      -- treats www.example.com (without a trailing dot) and
      -- www.example.com. (with a trailing dot) as identical.
    , hzCallerReference        :: !CallerReference
      -- ^ A unique string that identifies the request to create the hosted
      -- zone.
    , hzConfig                 :: !Config
      -- ^ A complex type that contains an optional comment about your
      -- hosted zone.
    , hzResourceRecordSetCount :: !Integer
      -- ^ The number of resource record sets in the hosted zone.
    } deriving (Eq, Show, Generic)

instance IsXML HostedZone where
    xmlPickler = withNS route53NS

newtype DelegationSet = DelegationSet { dsNameServers :: [ByteString] }
    deriving (Eq, Show, Generic)

instance IsXML DelegationSet where
    xmlPickler = xpWrap (DelegationSet, dsNameServers)
        (xpElem (route53Elem "NameServers")
            $ xpElemList (route53Elem "NameServer") xmlPickler)

data ChangeStatus = PENDING | INSYNC
    deriving (Eq, Read, Show, Generic)

instance IsXML ChangeStatus where
    xmlPickler = xpContent xpPrim

data ChangeInfo = ChangeInfo
    { ciId          :: !ByteString
    , ciStatus      :: !ChangeStatus
    , ciSubmittedAt :: !UTCTime
    } deriving (Eq, Show, Generic)

instance IsXML ChangeInfo where
    xmlPickler = withNS route53NS

data ChangeAction = CreateAction | DeleteAction
    deriving (Eq)

instance Show ChangeAction where
    show CreateAction = "CREATE"
    show DeleteAction = "DELETE"

instance Read ChangeAction where
    readPrec = readAssocList
         [ ("CREATE", CreateAction)
         , ("DELETE", DeleteAction)
         ]

instance IsXML ChangeAction where
    xmlPickler = xpContent xpPrim

data Change = Change
    { cAction            :: !ChangeAction
    , cResourceRecordSet :: !ResourceRecordSet
    } deriving (Eq, Show, Generic)

instance IsXML Change where
    xmlPickler = withNS route53NS

data ChangeBatch = ChangeBatch
    { cbComment :: Maybe ByteString
    , cbChanges :: [Change]
    } deriving (Eq, Show, Generic)

instance IsXML ChangeBatch where
    xmlPickler = withNS route53NS

newtype ResourceRecords = ResourceRecords { rrValues :: [ByteString] }
    deriving (Eq, Show, Generic)

instance IsXML ResourceRecords where
    xmlPickler = xpWrap (ResourceRecords, rrValues)
        (xpElemList (route53Elem "ResourceRecord")
            $ xpElem (route53Elem "Value") xmlPickler)

data AliasTarget = AliasTarget
    { atHostedZoneId         :: !ByteString
    , atDNSName              :: !ByteString
    , atEvaluateTargetHealth :: Maybe Bool
    } deriving (Eq, Show, Generic)

instance IsXML AliasTarget where
    xmlPickler = withNS route53NS

data Failover = PRIMARY | SECONDARY
    deriving (Eq, Read, Show, Generic)

instance IsXML Failover where
    xmlPickler = xpContent xpPrim

data ResourceRecordSet
    = FailoverRecordSet
      { rrsName            :: !ByteString
      , rrsType            :: !RecordType
      , rrsSetIdentifier   :: !ByteString
      , rrsFailover        :: !Failover
      , rrsTTL             :: !Integer
      , rrsResourceRecords :: !ResourceRecords
      , rrsHealthCheckId   :: Maybe ByteString
      }

    | FailoverAliasRecordSet
      { rrsName          :: !ByteString
      , rrsType          :: !RecordType
      , rrsSetIdentifier :: !ByteString
      , rrsFailover      :: !Failover
      , rrsAliasTarget   :: !AliasTarget
      , rrsHealthCheckId :: Maybe ByteString
      }

    | LatencyRecordSet
      { rrsName            :: !ByteString
      , rrsType            :: !RecordType
      , rrsSetIdentifier   :: !ByteString
      , rrsRegion          :: !Region
      , rrsTTL             :: !Integer
      , rrsResourceRecords :: !ResourceRecords
      , rrsHealthCheckId   :: Maybe ByteString
      }

    | LatencyAliasRecordSet
      { rrsName          :: !ByteString
      , rrsType          :: !RecordType
      , rrsSetIdentifier :: !ByteString
      , rrsRegion        :: !Region
      , rrsAliasTarget   :: !AliasTarget
      , rrsHealthCheckId :: Maybe ByteString
      }

    | WeightedRecordSet
      { rrsName            :: !ByteString
      , rrsType            :: !RecordType
      , rrsSetIdentifier   :: !ByteString
      , rrsWeight          :: !Integer
      , rrsTTL             :: !Integer
      , rrsResourceRecords :: !ResourceRecords
      , rrsHealthCheckId   :: Maybe ByteString
      }

    | WeightedAliasRecordSet
      { rrsName          :: !ByteString
      , rrsType          :: !RecordType
      , rrsSetIdentifier :: !ByteString
      , rrsWeight        :: !Integer
      , rrsAliasTarget   :: !AliasTarget
      , rrsHealthCheckId :: Maybe ByteString
      }

    | BasicRecordSet
      { rrsName            :: !ByteString
      , rrsType            :: !RecordType
      , rrsTTL             :: !Integer
      , rrsResourceRecords :: !ResourceRecords
      , rrsHealthCheckId   :: Maybe ByteString
      }

    | AliasRecordSet
      { rrsName          :: !ByteString
      , rrsType          :: !RecordType
      , rrsAliasTarget   :: !AliasTarget
      , rrsHealthCheckId :: Maybe ByteString
      }

    deriving (Eq, Show, Generic)

instance IsXML ResourceRecordSet where
    xmlPickler = genericXMLPickler $ (namespaced route53NS)
        { xmlCtorModifier = const $ route53Elem "ResourceRecordSet"
        }

data HealthCheckConfig = HealthCheckConfig
    { hccIPAddress                :: !ByteString
    , hccPort                     :: !Int
    , hccType                     :: !Protocol
    , hccResourcePath             :: !ByteString
    , hccFullyQualifiedDomainName :: !ByteString
    } deriving (Eq, Show, Generic)

instance IsXML HealthCheckConfig where
    xmlPickler = withNS route53NS

data HealthCheck = HealthCheck
    { hcId                :: !ByteString
    , hcCallerReference   :: !CallerReference
    , hcHealthCheckConfig :: !HealthCheckConfig
    } deriving (Eq, Show, Generic)

instance IsXML HealthCheck where
    xmlPickler = withNS route53NS