var $pluginID = "com.mob.sharesdk.DouBan";eval(function(p,a,c,k,e,r){e=function(c){return(c<62?'':e(parseInt(c/62)))+((c=c%62)>35?String.fromCharCode(c+29):c.toString(36))};if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'([7-9a-cefhk-mo-qs-zA-Z]|[12]\\w)'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('c y={"14":"api_key","15":"16","17":"1N","1l":"covert_url"};h k(o){a.24=o;a.t={"H":7,"I":7};a.18=7}k.p.o=h(){z a.24};k.p.U=h(){z"豆瓣"};k.p.P=h(){9(a.t["I"]!=7&&a.t["I"][y.14]!=7){z a.t["I"][y.14]}q 9(a.t["H"]!=7&&a.t["H"][y.14]!=7){z a.t["H"][y.14]}z 7};k.p.16=h(){9(a.t["I"]!=7&&a.t["I"][y.15]!=7){z a.t["I"][y.15]}q 9(a.t["H"]!=7&&a.t["H"][y.15]!=7){z a.t["H"][y.15]}z 7};k.p.X=h(){9(a.t["I"]!=7&&a.t["I"][y.17]!=7){z a.t["I"][y.17]}q 9(a.t["H"]!=7&&a.t["H"][y.17]!=7){z a.t["H"][y.17]}z 7};k.p.1O=h(){z"25-26-"+$8.b.1h.k+"-"+a.P()};k.p.1P=h(){9(a.t["I"]!=7&&a.t["I"][y.1l]!=7){z a.t["I"][y.1l]}q 9(a.t["H"]!=7&&a.t["H"][y.1l]!=7){z a.t["H"][y.1l]}z $8.b.1P()};k.p.27=h(1i){9(28.1j==0){z a.t["H"]}q{a.t["H"]=a.1Q(1i)}};k.p.29=h(1i){9(28.1j==0){z a.t["I"]}q{a.t["I"]=a.1Q(1i)}};k.p.saveConfig=h(){c s=a;c 19="25-26";$8.1a.2a("2b",1m,19,h(e){9(e!=7){c 1n=e.1i;9(1n==7){1n={}}1n["plat_"+s.o()]=s.P();$8.1a.2c("2b",1n,1m,19,7)}})};k.p.isSupportAuth=h(){z 2d};k.p.authorize=h(D,1R){c l=7;9(a.2e()){a.2f(D,1R)}q{l={"B":$8.b.E.InvaildPlatform,"Q":"分享平台［"+a.U()+"］应用信息无效!"};$8.R.Y(D,$8.b.v.C,l)}};k.p.handleAuthCallback=h(D,1w){c l=7;c s=a;c 1x=$8.K.parseUrl(1w);9(1x!=7&&1x.1y!=7){c x=$8.K.parseUrlParameters(1x.1y);9(x!=7){x["2g"]=a.P();x["client_secret"]=a.16();x["grant_type"]="authorization_code";x["1N"]=a.X();$8.1a.2h($8.b.1h.k,7,"1z://2i.1A.1B/2j/2k/1S","1C",x,7,h(e){9(e!=7){9(e["B"]!=7){$8.R.Y(D,$8.b.v.C,e)}q 9(e["1T"]!=7&&e["1T"]==2l){c N=$8.K.2m($8.K.2n(e["2o"]));9(N.1b==7){s.2p(D,N)}q{l={"B":$8.b.E.Z,"1D":N};$8.R.Y(D,$8.b.v.C,l)}}q{l={"B":$8.b.E.Z,"1D":e};$8.R.Y(D,$8.b.v.C,l)}}q{l={"B":$8.b.E.Z};$8.R.Y(D,$8.b.v.C,l)}})}q{l={"B":$8.b.E.2q,"Q":"无效的授权回调:["+1w+"]"};$8.R.Y(D,$8.b.v.C,l)}}q{l={"B":$8.b.E.2q,"Q":"无效的授权回调:["+1w+"]"};$8.R.Y(D,$8.b.v.C,l)}};k.p.cancelAuthorize=h(){a.1E(7,7)};k.p.addFriend=h(D,m,f){c l={"B":$8.b.E.1U,"Q":"分享平台［"+s.U()+"］不支持添加好友!"};9(f!=7){f($8.b.v.C,l)}};k.p.getFriends=h(cursor,size,f){c l={"B":$8.b.E.1U,"Q":"分享平台［"+s.U()+"］不支持获取好友列表!"};9(f!=7){f($8.b.v.C,l)}};k.p.share=h(D,F,f){c w=7;c A=7;c V=7;c 1o=7;c L=7;c s=a;c 1F=F["@1F"];c 1c={"@1F":1F};c o=$8.b.M(a.o(),F,"o");9(o==7){o=$8.b.10.2r}9(o==$8.b.10.2r){o=a.2s(F)}c 1G="1z://2t.1A.1B/shuo/v2/statuses/";c x=7;2v(o){S $8.b.10.2w:{w=$8.b.M(a.o(),F,"w");x={"w":w};a.1k(h(m){s.1H([w],h(e){x["w"]=e.11[0];s.1p(1G,"1C",x,h(J,e){c u=e;9(J==$8.b.v.1d){9(e!=7){u={};u["1q"]=e;u["1V"]=e["id"];u["w"]=e["w"]}}9(f!=7){f(J,u,m,1c)}})})});1e}S $8.b.10.2x:{c O=$8.b.M(a.o(),F,"O");9(2y.p.1W.2z(O)===\'[2A 2B]\'){L=O[0]}w=$8.b.M(a.o(),F,"w");9(L!=7){a.2C(L,h(1r){c 1s="application/octet-stream";9(/\\.jpe?g$/.1t(1r)){1s="L/jpeg"}q 9(/\\.2D$/.1t(1r)){1s="L/2D"}q 9(/\\.2E$/.1t(1r)){1s="L/2E"}c 1J={"path":1r,"mime_type":1s};x={"L":"@1J("+$8.K.1X(1J)+")","w":w};s.1k(h(m){s.1H([w],h(e){x["w"]=e.11[0];s.1p(1G,"1C",x,h(J,e){c u=e;9(J==$8.b.v.1d){9(e!=7){u={};u["1q"]=e;u["1V"]=e["id"];u["w"]=e["w"];u["O"]=[];c T=e["T"];9(T!=7){1K(c i=0;i<T.1j;i++){c 12=T[i]["13"];9(12!=7){1K(c j=0;j<12.1j;j++){c 13=12[j];9(13["o"]=="L"){u["O"].2F(13["2G"]);1e}}}}}}}9(f!=7){f(J,u,m,1c)}})})})})}q{l={"B":$8.b.E.Z,"Q":"分享参数L不能为空!"};9(f!=7){f($8.b.v.C,l,7,1c)}}1e}S $8.b.10.2H:A=$8.b.M(a.o(),F,"A");w=$8.b.M(a.o(),F,"w");V=$8.b.M(a.o(),F,"V");1o=$8.b.M(a.o(),F,"1o");L=$8.b.M(a.o(),F,"url_image");9(V!=7&&A!=7){x={"w":w,"rec_title":V,"2I":A,"2J":1o,"rec_image":L};s.1k(h(m){s.1H([w,1o,A],h(e){x["w"]=e.11[0];x["2J"]=e.11[1];x["2I"]=e.11[2];s.1p(1G,"1C",x,h(J,e){c u=e;9(J==$8.b.v.1d){9(e!=7){u={};u["1q"]=e;u["1V"]=e["id"];u["w"]=e["w"];u["urls"]=[A];u["O"]=[];c T=e["T"];9(T!=7){1K(c i=0;i<T.1j;i++){c 12=T[i]["13"];9(12!=7){1K(c j=0;j<12.1j;j++){c 13=12[j];9(13["o"]=="L"){u["O"].2F(13["2G"]);1e}}}}}}}9(f!=7){f(J,u,m,1c)}})})})}q{l={"B":$8.b.E.Z,"Q":"分享参数A、V不能为空!"};9(f!=7){f($8.b.v.C,l,7,1c)}}1e;default:{c l={"B":$8.b.E.UnsupportContentType,"Q":"不支持的分享类型["+o+"]"};9(f!=7){f($8.b.v.C,l,7,1c)}1e}}};k.p.2K=h(1y,f){c s=a;9(1y!=7){c l={"B":$8.b.E.1U,"Q":"分享平台［"+s.U()+"］不支持获取其他用户资料!"};9(f!=7){f($8.b.v.C,l)}z}s.1p("1z://2t.1A.1B/v2/m/~me","GET",7,h(J,e){c u=e;9(J==$8.b.v.1d){u={"2L":$8.b.1h.k};s.2M(u,e)}9(f!=7){f(J,u)}})};k.p.1p=h(A,2N,x,f){c l=7;c s=a;a.1k(h(m){9(m!=7){9(x==7){x={}}x["source"]=s.P();c 1Y=7;9(m.1f!=7){1Y={"Authorization":"Bearer "+m.1f.1S}}$8.1a.2h($8.b.1h.k,7,A,2N,x,1Y,h(e){9(e!=7){9(e["B"]!=7){9(f){f($8.b.v.C,e)}}q{c N=$8.K.2m($8.K.2n(e["2o"]));9(e["1T"]==2l){9(N["1b"]==7&&N["r"]==7){9(f){f($8.b.v.1d,N)}}q{c 1b=$8.b.E.Z;2v(N["1b"]){S 102:S 103:S 106:S 118:S 119:S 123:S 124:1b=$8.b.E.2O;1e}l={"B":1b,"1D":N};9(f){f($8.b.v.C,l)}}}q{l={"B":$8.b.E.Z,"1D":N};9(f){f($8.b.v.C,l)}}}}q{l={"B":$8.b.E.Z};9(f){f($8.b.v.C,l)}}})}q{l={"B":$8.b.E.2O,"Q":"尚未授权["+s.U()+"]用户"};9(f){f($8.b.v.C,l)}}})};k.p.2C=h(A,f){9(!/^(1J\\:\\/)?\\//.1t(A)){$8.1a.downloadFile(A,h(e){9(e.11!=7){9(f!=7){f(e.11)}}q{9(f!=7){f(7)}}})}q{9(f!=7){f(A)}}};k.p.1H=h(1Z,f){9(a.1P()){c s=a;a.1k(h(m){$8.b.convertUrl(s.o(),m,1Z,f)})}q{9(f){f({"11":1Z})}}};k.p.2s=h(F){c o=$8.b.10.2w;c A=$8.b.M(a.o(),F,"A");c V=$8.b.M(a.o(),F,"V");9(A!=7&&V!=7){o=$8.b.10.2H}q{c O=$8.b.M(a.o(),F,"O");9(2y.p.1W.2z(O)===\'[2A 2B]\'){o=$8.b.10.2x}}z o};k.p.2M=h(m,G){9(m!=7&&G!=7){m["1q"]=G;m["2P"]=G["id"];m["nickname"]=G["U"];9(G["2Q"]!=7){m["20"]=G["2Q"]}q 9(G["2R"]){m["20"]=G["2R"]}q 9(G["2S"]){m["20"]=G["2S"]}m["gender"]=2;m["A"]=G["alt"];9(G["1L"]!=7){c 1u=7;c 21=/(\\d+)-(\\d+)-(\\d+) (\\d+):(\\d+):(\\d+)/;9(21.1t(G["1L"])){c 1g=21.exec(G["1L"]);1u=22 1M(1g[1],1g[2]-1,1g[3],1g[4],1g[5],1g[6])}q{1u=22 1M(G["1L"])}9(1u.1W()!="Invalid 1M"){m["reg_at"]=1u.2T()}}}};k.p.2f=h(D,1R){c A="1z://2i.1A.1B/2j/2k/auth?2g="+a.P()+"&response_type=1b&1N="+$8.K.urlEncode(a.X())+"&display=mobile";$8.R.ssdk_openAuthUrl(D,A,a.X())};k.p.2p=h(D,1v){c s=a;c 1f={"2P":1v["douban_user_id"],"1S":1v["access_token"],"expired":(22 1M().2T()+1v["expires_in"]*1000),"1q":1v,"o":$8.b.credentialType.OAuth2};c m={"2L":$8.b.1h.k,"1f":1f};a.1E(m,h(){s.2K(7,h(J,e){9(J==$8.b.v.1d){e["1f"]=m["1f"];m=e;s.1E(m,7)}$8.R.Y(D,$8.b.v.1d,m)})})};k.p.1E=h(m,f){a.18=m;c 19=a.1O();$8.1a.2c("2U",a.18,1m,19,h(e){9(f!=7){f()}})};k.p.1k=h(f){9(a.18!=7){9(f){f(a.18)}}q{c s=a;c 19=a.1O();$8.1a.2a("2U",1m,19,h(e){s.18=e!=7?e.1i:7;9(f){f(s.18)}})}};k.p.2e=h(){9(a.P()!=7&&a.16()!=7&&a.X()!=7){z 2d}$8.R.log("#warning:["+a.U()+"]应用信息有误，不能进行相关操作。请检查本地代码中和服务端的["+a.U()+"]平台应用配置是否有误! \\n本地配置:"+$8.K.1X(a.27())+"\\n服务器配置:"+$8.K.1X(a.29()));z 1m};k.p.1Q=h(W){c P=$8.K.23(W[y.14]);c 16=$8.K.23(W[y.15]);c X=$8.K.23(W[y.17]);9(P!=7&&16!=7&&X!=7){W[y.14]=P;W[y.15]=16;W[y.17]=X}q{W=7}z W};$8.b.registerPlatformClass($8.b.1h.k,k);',[],181,'|||||||null|mob|if|this|shareSDK|var||data|callback||function|||DouBan|error|user||type|prototype|else||self|_appInfo|resultData|responseState|text|params|DouBanAppInfoKeys|return|url|error_code|Fail|sessionId|errorCode|parameters|rawData|local|server|state|utils|image|getShareParam|response|images|apiKey|error_message|native|case|attachments|name|title|appInfo|redirectUri|ssdk_authStateChanged|APIRequestFail|contentType|result|medias|media|ApiKey|Secret|secret|RedirectUri|_currentUser|domain|ext|code|userData|Success|break|credential|res|platformType|value|length|_getCurrentUser|ConvertUrl|false|curApps|desc|callApi|raw_data|imageUrl|mimeType|test|date|credentialRawData|callbackUrl|urlInfo|query|https|douban|com|POST|user_data|_setCurrentUser|flags|requestUrl|_convertUrl||file|for|created|Date|redirect_uri|cacheDomain|convertUrlEnabled|_checkAppInfoAvailable|settings|token|status_code|UnsupportFeature|cid|toString|objectToJsonString|header|contents|icon|exp|new|trim|_type|SSDK|Platform|localAppInfo|arguments|serverAppInfo|getCacheData|currentApp|setCacheData|true|_isAvailable|_webAuthorize|client_id|ssdk_callHTTPApi|www|service|auth2|200|jsonStringToObject|base64Decode|response_data|_succeedAuthorize|InvalidAuthCallback|Auto|_getShareType|api||switch|Text|Image|Object|apply|object|Array|_getImagePath|png|gif|push|src|WebPage|rec_url|rec_desc|getUserInfo|platform_type|_updateUserInfo|method|UserUnauth|uid|large_avatar|avatar|small_avatar|getTime|currentUser'.split('|'),0,{}))