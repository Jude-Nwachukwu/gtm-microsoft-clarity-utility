___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Microsoft Clarity Utility",
  "description": "This utility variable can be used to retrieve the Microsoft Clarity session playback URL, the Clarity session ID and user ID for the current user session.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "selectUtilityOption",
    "displayName": "Select Microsoft Clarity Variable to Retrieve",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "mcPlaybackURL",
        "displayValue": "Session Replay URL"
      },
      {
        "value": "mcSessionID",
        "displayValue": "Clarity Session ID"
      },
      {
        "value": "mcUserID",
        "displayValue": "Clarity User ID"
      }
    ],
    "simpleValueType": true,
    "help": "Select the Microsoft Clarity variable you want to retrieve in your GTM setup.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "clarityProjectID",
    "displayName": "Microsoft Clarity Project ID",
    "simpleValueType": true,
    "valueHint": "e.g., abc123xyz",
    "help": "Enter your Microsoft Clarity project ID in this field.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "selectUtilityOption",
        "paramValue": "mcPlaybackURL",
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const getCookieValues = require('getCookieValues');
const decode = require('decodeUri');

const utilityOption = data.selectUtilityOption;
const clarityProjectID = data.clarityProjectID;

// Read and decode Clarity cookies
const clskCookieValues = getCookieValues('_clsk', true);
const clckCookieValues = getCookieValues('_clck', true);

// Validate cookie presence
if (!clskCookieValues || !clskCookieValues.length || 
    !clckCookieValues || !clckCookieValues.length) {
  return undefined;
}

// Decode cookie values
let clskValue = decode(clskCookieValues[0]);
let clckValue = decode(clckCookieValues[0]);

if (!clskValue || !clckValue) {
  return undefined;
}

// Helper: split by ^ first, else by |
function splitValue(val) {
  if (val.indexOf('^') !== -1) {
    return val.split('^')[0];
  }
  return val.split('|')[0];
}

// Extract ID parts using helper
clskValue = splitValue(clskValue);
clckValue = splitValue(clckValue);

if (!clskValue || !clckValue) {
  return undefined;
}

// Conditional return based on selected option
if (utilityOption === 'mcPlaybackURL') {
  return 'https://clarity.microsoft.com/player/' + clarityProjectID + '/' + clckValue + '/' + clskValue;
} else if (utilityOption === 'mcSessionID') {
  return clskValue;
} else if (utilityOption === 'mcUserID') {
  return clckValue;
}

return undefined;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "_clsk"
              },
              {
                "type": 1,
                "string": "_clck"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 4/22/2025, 12:36:37 PM


