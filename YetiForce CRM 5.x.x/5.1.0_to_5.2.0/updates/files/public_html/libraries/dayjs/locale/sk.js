!function(e,d){"object"==typeof exports&&"undefined"!=typeof module?module.exports=d(require("dayjs")):"function"==typeof define&&define.amd?define(["dayjs"],d):e.dayjs_locale_sk=d(e.dayjs)}(this,function(e){"use strict";e=e&&e.hasOwnProperty("default")?e.default:e;var d={name:"sk",weekdays:"Nedeľa_Pondelok_Utorok_Streda_Štvrtok_Piatok_Sobota".split("_"),months:"január_február_marec_apríl_máj_jún_júl_august_september_október_november_december".split("_"),weekStart:1,relativeTime:{future:"o %s",past:"pred %s",s:"niekoľko sekúnd",m:"minúta",mm:"%d minút",h:"hodina",hh:"%d hodín",d:"deň",dd:"%d dní",M:"mesiac",MM:"%d mesiacov",y:"rok",yy:"%d rokov"},ordinal:function(e){return e+"º"},formats:{LT:"H:mm",LTS:"H:mm:ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY H:mm",LLLL:"dddd D. MMMM YYYY H:mm"}};return e.locale(d,null,!0),d});