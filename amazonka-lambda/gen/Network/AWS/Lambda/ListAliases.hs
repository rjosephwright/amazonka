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
-- Module      : Network.AWS.Lambda.ListAliases
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns list of aliases created for a Lambda function. For each alias,
-- the response includes information such as the alias ARN, description,
-- alias name, and the function version to which it points. For more
-- information, see
-- <http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html Introduction to AWS Lambda Aliases>
--
-- This requires permission for the lambda:ListAliases action.
--
-- /See:/ <http://docs.aws.amazon.com/lambda/latest/dg/API_ListAliases.html AWS API Reference> for ListAliases.
module Network.AWS.Lambda.ListAliases
    (
    -- * Creating a Request
      listAliases
    , ListAliases
    -- * Request Lenses
    , laMarker
    , laMaxItems
    , laFunctionVersion
    , laFunctionName

    -- * Destructuring the Response
    , listAliasesResponse
    , ListAliasesResponse
    -- * Response Lenses
    , larsAliases
    , larsNextMarker
    , larsResponseStatus
    ) where

import           Network.AWS.Lambda.Types
import           Network.AWS.Lambda.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'listAliases' smart constructor.
data ListAliases = ListAliases'
    { _laMarker          :: !(Maybe Text)
    , _laMaxItems        :: !(Maybe Nat)
    , _laFunctionVersion :: !(Maybe Text)
    , _laFunctionName    :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListAliases' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'laMarker'
--
-- * 'laMaxItems'
--
-- * 'laFunctionVersion'
--
-- * 'laFunctionName'
listAliases
    :: Text -- ^ 'laFunctionName'
    -> ListAliases
listAliases pFunctionName_ =
    ListAliases'
    { _laMarker = Nothing
    , _laMaxItems = Nothing
    , _laFunctionVersion = Nothing
    , _laFunctionName = pFunctionName_
    }

-- | Optional string. An opaque pagination token returned from a previous
-- ListAliases operation. If present, indicates where to continue the
-- listing.
laMarker :: Lens' ListAliases (Maybe Text)
laMarker = lens _laMarker (\ s a -> s{_laMarker = a});

-- | Optional integer. Specifies the maximum number of aliases to return in
-- response. This parameter value must be greater than 0.
laMaxItems :: Lens' ListAliases (Maybe Natural)
laMaxItems = lens _laMaxItems (\ s a -> s{_laMaxItems = a}) . mapping _Nat;

-- | If you specify this optional parameter, the API returns only the aliases
-- pointing to the specific Lambda function version, otherwise returns all
-- aliases created for the Lambda function.
laFunctionVersion :: Lens' ListAliases (Maybe Text)
laFunctionVersion = lens _laFunctionVersion (\ s a -> s{_laFunctionVersion = a});

-- | Lambda function name for which the alias is created.
laFunctionName :: Lens' ListAliases Text
laFunctionName = lens _laFunctionName (\ s a -> s{_laFunctionName = a});

instance AWSRequest ListAliases where
        type Rs ListAliases = ListAliasesResponse
        request = get lambda
        response
          = receiveJSON
              (\ s h x ->
                 ListAliasesResponse' <$>
                   (x .?> "Aliases" .!@ mempty) <*> (x .?> "NextMarker")
                     <*> (pure (fromEnum s)))

instance ToHeaders ListAliases where
        toHeaders = const mempty

instance ToPath ListAliases where
        toPath ListAliases'{..}
          = mconcat
              ["/2015-03-31/functions/", toBS _laFunctionName,
               "/aliases"]

instance ToQuery ListAliases where
        toQuery ListAliases'{..}
          = mconcat
              ["Marker" =: _laMarker, "MaxItems" =: _laMaxItems,
               "FunctionVersion" =: _laFunctionVersion]

-- | /See:/ 'listAliasesResponse' smart constructor.
data ListAliasesResponse = ListAliasesResponse'
    { _larsAliases        :: !(Maybe [AliasConfiguration])
    , _larsNextMarker     :: !(Maybe Text)
    , _larsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListAliasesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'larsAliases'
--
-- * 'larsNextMarker'
--
-- * 'larsResponseStatus'
listAliasesResponse
    :: Int -- ^ 'larsResponseStatus'
    -> ListAliasesResponse
listAliasesResponse pResponseStatus_ =
    ListAliasesResponse'
    { _larsAliases = Nothing
    , _larsNextMarker = Nothing
    , _larsResponseStatus = pResponseStatus_
    }

-- | An list of alises.
larsAliases :: Lens' ListAliasesResponse [AliasConfiguration]
larsAliases = lens _larsAliases (\ s a -> s{_larsAliases = a}) . _Default . _Coerce;

-- | A string, present if there are more aliases.
larsNextMarker :: Lens' ListAliasesResponse (Maybe Text)
larsNextMarker = lens _larsNextMarker (\ s a -> s{_larsNextMarker = a});

-- | The response status code.
larsResponseStatus :: Lens' ListAliasesResponse Int
larsResponseStatus = lens _larsResponseStatus (\ s a -> s{_larsResponseStatus = a});
