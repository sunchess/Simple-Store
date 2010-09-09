/**
 * RightJS UI Colorpicker widget
 *
 * See http://rightjs.org/ui/colorpicker
 *
 * Copyright (C) 2010 Nikolay Nemshilov
 */
var Colorpicker=RightJS.Colorpicker=function(p,q,i,e){function r(a,b,c,d){if(e.Fx)if(c===undefined){c=this.options.fxName;if(d===undefined){d={duration:this.options.fxDuration,onFinish:e(this.fire).bind(this,b)};if(b==="hide")d.duration=(e.Fx.Durations[d.duration]||d.duration)/2}}e.Element.prototype[b].call(a,c,d);if(!e.Fx||!c)this.fire(b);return this}var j=e,n=e.$,u=e.$w,v=e.$$,h=e.$E,s=e.$A,w=e.isArray,o=e.Wrapper,m=e.Element,t=e.Input,x=new e.Wrapper(e.Element,{initialize:function(a,b){this.$super("div",
b);this._.innerHTML=a;this.addClass("rui-button")},disable:function(){return this.addClass("rui-button-disabled")},enable:function(){return this.removeClass("rui-button-disabled")},disabled:function(){return this.hasClass("rui-button-disabled")},enabled:function(){return!this.disabled()},fire:function(){this.enabled()&&this.$super.apply(this,arguments);return this}}),g=new (function(a,b){if(!b){b=a;a="DIV"}var c=new e.Wrapper(e.Element.Wrappers[a]||e.Element,{initialize:function(d,f){this.key=d;var k=
[{"class":"rui-"+d}];this instanceof e.Input||this instanceof e.Form||k.unshift(a);this.$super.apply(this,k);if(e.isString(f))f=e.$(f);if(f instanceof e.Element){this._=f._;if("$listeners"in f)f.$listeners=f.$listeners;f={}}this.setOptions(f,this);return this},setOptions:function(d,f){f=f||this;e.Options.setOptions.call(this,e.Object.merge(d,eval("("+(f.get("data-"+this.key)||"{}")+")")));return this}});c=new e.Wrapper(c,b);e.Observer.createShortcuts(c.prototype,c.EVENTS||[]);return c})({include:[{show:function(a,
b){this.constructor.current=this;return r.call(this,this,"show",a,b)},hide:function(a,b){this.constructor.current=null;return r.call(this,this,"hide",a,b)},showAt:function(a,b,c){var d=this.hide(null).shownAt=a=e.$(a),f=(this.reAnchor||(this.reAnchor=new e.Element("div",{"class":"rui-re-anchor"})).insert(this)).insertTo(d,"after").position();a=d.dimensions();var k=i(d.getStyle("borderTopWidth")),l=i(d.getStyle("borderLeftWidth")),y=i(d.getStyle("borderRightWidth")),z=i(d.getStyle("borderBottomWidth"));
d=a.top-f.y+k;f=a.left-f.x+l;l=a.width-l-y;a=a.height-k-z;this.setStyle("visibility:hidden").show(null);if(b==="right")f+=l-this.size().x;else d+=a;this.moveTo(f,d);if(c)["left","right"].include(b)?this.setHeight(a):this.setWidth(l);this.setStyle("visibility:visible").hide(null);return this.show()},toggleAt:function(a,b,c){return this.hidden()?this.showAt(a,b,c):this.hide()}},{assignTo:function(a,b){a=e.$(a);if(b=e.$(b)){b[this.key]=this;b.assignedInput=a}else a[this.key]=this;var c=e(function(){if(this.visible()&&
(!this.showAt||this.shownAt===a))this.setValue(a.value())}).bind(this);a.on({keyup:c,change:c});this.onChange(function(){if(!this.showAt||this.shownAt===a)a.setValue(this.getValue())});return this}}],extend:{version:"2.0.0",EVENTS:u("change show hide done"),Options:{format:"hex",update:null,updateBg:null,trigger:null,fxName:"fade",fxDuration:"short",cssRule:"*[data-colorpicker]"},i18n:{Done:"Done"},hideAll:function(){v("div.rui-colorpicker").each(function(a){a instanceof g&&!a.inlined()&&a.hide()})}},
initialize:function(a){this.$super("colorpicker",a).addClass("rui-panel").insert([this.field=new A,this.colors=new B,this.controls=new C]).on({mousedown:this.startTrack,keyup:this.recalc,blur:this.update,focus:this.cancelTimer,done:this.done});this.options.update&&this.assignTo(this.options.update,this.options.trigger);this.options.updateBg&&this.updateBg(this.options.updateBg);this.tint=j([1,0,0]);this.satur=0;this.bright=1;this.color=j([255,255,255]);this.recalc().update()},setValue:function(a){if((a=
w(a)?a:this.toColor(a))&&a.length===3){this.color=a=a.map(function(b){return this.bound(i(""+b),0,255)},this);this.color2tint().update();this.colors.size().y||this.update.bind(this).delay(20)}return this},getValue:function(a){return a?this.color:this[this.options.format==="rgb"?"toRgb":"toHex"]()},updateBg:function(a){var b=n(a);b&&this.onChange(j(function(){b._.style.backgroundColor=this.toRgb()}).bind(this));return this},insertTo:function(a,b){return this.$super(a,b).addClass("rui-colorpicker-inline")},
inlined:function(){return this.hasClass("rui-colorpicker-inline")},done:function(){this.inlined()||this.hide();return this},setOptions:function(a){a=a||{};this.$super(a,n(a.trigger||a.update))},update:function(){this.field._.style.backgroundColor="rgb("+this.tint.map(function(d){return q.round(d*255)})+")";var a=this.color,b=this.controls;b.preview._.style.backgroundColor=b.display._.value=this.toHex();b.rDisplay._.value=a[0];b.gDisplay._.value=a[1];b.bDisplay._.value=a[2];b=this.field.pointer._.style;
a=this.field.size();var c=this.satur*a.x-2;b.top=this.bound(a.y-this.bright*a.y-2,0,a.y-5)+"px";b.left=this.bound(c,0,a.x-5)+"px";b=this.tint;a=this.colors.size();b=b[1]==0?b[0]==1?b[2]:2-b[0]:b[0]==0?2+(b[2]==1?b[1]:2-b[2]):4+(b[1]==1?b[0]:2-b[1]);b=b/6*a.y;this.colors.pointer._.style.top=this.bound(b,0,a.y-4)+"px";if(this.prevColor!==""+this.color){this.fire("change",this.color);this.prevColor=""+this.color}return this},recalc:function(a){if(a){a=a.target;var b=a._.value,c=s(this.color),d=false;
if(a===this.controls.display&&/#\w{6}/.test(b))d=c=this.toColor(b);else if(/^\d+$/.test(b)){c[a._.cIndex]=b;d=true}d&&this.setValue(c)}else this.tint2color();return this},startTrack:function(a){this.stopTrack();this.cancelTimer();if(a.target===this.field.pointer)a.target=this.field;else if(a.target===this.colors.pointer)a.target=this.colors;if(a.target===this.field||a.target===this.colors){a.stop();g.tracking=this;a.target.tracking=true;this.trackMove(a)}},stopTrack:function(){g.tracking=false;this.field.tracking=
false;this.colors.tracking=false},trackMove:function(a){var b,c=a.position();if(this.field.tracking)b=this.field.dimensions();else if(this.colors.tracking)b=this.colors.dimensions();if(b){a=this.bound(c.y-b.top,0,b.height);c=this.bound(c.x-b.left,0,b.width);if(this.field.tracking){this.satur=c/b.width;this.bright=1-a/b.height}else if(this.colors.tracking){if(a==b.height)a=b.height-0.1;b=b.height/6;c=this.tint=[0,0,0];var d=a%b/b,f=1-d;if(a<b){c[0]=1;c[2]=d}else if(a<b*2){c[0]=f;c[2]=1}else if(a<b*
3){c[2]=1;c[1]=d}else if(a<b*4){c[2]=f;c[1]=1}else if(a<b*5){c[1]=1;c[0]=d}else{c[1]=f;c[0]=1}}this.recalc().update()}},cancelTimer:function(){j(function(){if(this._hide_delay){this._hide_delay.cancel();this._hide_delay=null}}).bind(this).delay(10)}}),A=new o(m,{initialize:function(){this.$super("div",{"class":"field"});this.insert(this.pointer=h("div",{"class":"pointer"}))}}),B=new o(m,{initialize:function(){this.$super("div",{"class":"colors"});this.insert(this.pointer=h("div",{"class":"pointer"}))}}),
C=new o(m,{initialize:function(){this.$super("div",{"class":"controls"});this.insert([this.preview=h("div",{"class":"preview",html:"&nbsp;"}),this.display=h("input",{type:"text","class":"display",maxlength:7}),h("div",{"class":"rgb-display"}).insert([h("div").insert([h("label",{html:"R:"}),this.rDisplay=h("input",{maxlength:3,cIndex:0})]),h("div").insert([h("label",{html:"G:"}),this.gDisplay=h("input",{maxlength:3,cIndex:1})]),h("div").insert([h("label",{html:"B:"}),this.bDisplay=h("input",{maxlength:3,
cIndex:2})])]),this.button=(new x(g.i18n.Done)).onClick("fire","done")])}});g.include({toRgb:function(){return"rgb("+this.color.join(",")+")"},toHex:function(){return"#"+this.color.map(function(a){return(a<16?"0":"")+a.toString(16)}).join("")},toColor:function(a){a=a.toLowerCase();var b;if(b=/rgb\((\d+),(\d+),(\d+)\)/.exec(a))return[b[1],b[2],b[3]].map(i);else if(/#[\da-f]+/.test(a)){if(b=/^#([\da-f])([\da-f])([\da-f])$/.exec(a))a="#"+b[1]+b[1]+b[2]+b[2]+b[3]+b[3];if(b=/#([\da-f]{2})([\da-f]{2})([\da-f]{2})/.exec(a))return[b[1],
b[2],b[3]].map(function(c){return i(c,16)})}},color2tint:function(){var a=s(this.color).sort(function(d,f){return d-f}),b=a[0],c=a[2];this.bright=c/255;this.satur=1-b/(c||1);this.tint.each(function(d,f){this.tint[f]=!b&&!c||b==c?f==0?1:0:(this.color[f]-b)/(c-b);return this.tint[f]},this);return this},tint2color:function(){for(var a=this.tint,b=this.color,c=0;c<3;c++){b[c]=1+this.satur*(a[c]-1);b[c]=q.round(255*b[c]*this.bright)}return this},bound:function(a,b,c){a=a;if(b<c)a=a<b?b:a>c?c:a;else{if(a>
c)a=c;if(a<b)a=b}return a}});n(p).on({mouseup:function(){g.tracking&&g.tracking.stopTrack()},mousemove:function(a){g.tracking&&g.tracking.trackMove(a)},focus:function(a){a=a.target instanceof t?a.target:null;g.hideAll();if(a&&(a.colorpicker||a.match(g.Options.cssRule)))(a.colorpicker||new g({update:a})).setValue(a.value()).showAt(a)},blur:function(a){var b=a.target.colorpicker;if(b)b._hide_delay=j(function(){b.hide()}).delay(200)},click:function(a){var b=a.target instanceof m?a.target:null;if(b&&
(b.colorpicker||b.match(g.Options.cssRule))){if(!(b instanceof t)){a.stop();(b.colorpicker||new g({trigger:b})).hide(null).toggleAt(b.assignedInput)}}else a.find("div.rui-colorpicker")||g.hideAll()},keydown:function(a){var b=g.current,c={27:"hide",13:"done"}[a.keyCode];if(c&&b&&b.visible()){a.stop();b[c]()}}});p.write('<style type="text/css"> *.rui-button{display:inline-block; *display:inline; *zoom:1;height:1em;line-height:1em;margin:0;padding:.2em .5em;text-align:center;border:1px solid #CCC;border-radius:.2em;-moz-border-radius:.2em;-webkit-border-radius:.2em;cursor:pointer;color:#333;background-color:#FFF;user-select:none;-moz-user-select:none;-webkit-user-select:none} *.rui-button:hover{color:#111;border-color:#999;background-color:#DDD;box-shadow:#888 0 0 .1em;-moz-box-shadow:#888 0 0 .1em;-webkit-box-shadow:#888 0 0 .1em} *.rui-button:active{color:#000;border-color:#777;text-indent:1px;box-shadow:none;-moz-box-shadow:none;-webkit-box-shadow:none} *.rui-button-disabled, *.rui-button-disabled:hover, *.rui-button-disabled:active{color:#888;background:#DDD;border-color:#CCC;cursor:default;text-indent:0;box-shadow:none;-moz-box-shadow:none;-webkit-box-shadow:none}div.rui-re-anchor{margin:0;padding:0;background:none;border:none;float:none;display:inline;position:absolute;z-index:9999}.rui-panel{margin:0;padding:.5em;position:relative;background-color:#EEE;border:1px solid #BBB;border-radius:.3em;-moz-border-radius:.3em;-webkit-border-radius:.3em;box-shadow:.15em .3em .5em #BBB;-moz-box-shadow:.15em .3em .5em #BBB;-webkit-box-shadow:.15em .3em .5em #BBB;cursor:default}div.rui-colorpicker .field,div.rui-colorpicker .field *,div.rui-colorpicker .colors,div.rui-colorpicker .colors *{border:none;background:none;width:auto;height:auto;position:static;float:none;top:none;left:none;right:none;bottom:none;margin:0;padding:0;display:block;font-weight:normal;vertical-align:center}div.rui-colorpicker div.field,div.rui-colorpicker div.field div.pointer,div.rui-colorpicker div.colors,div.rui-colorpicker div.colors div.pointer{background:url(/images/rightjs-ui/colorpicker.png) no-repeat 0 0}div.rui-colorpicker div.field,div.rui-colorpicker div.colors,div.rui-colorpicker div.controls{display:inline-block; *display:inline; *zoom:1;position:relative;vertical-align:top;height:150px}div.rui-colorpicker div.field div.pointer,div.rui-colorpicker div.colors div.pointer{position:absolute;top:0px;left:0;width:9px;height:9px}div.rui-colorpicker input.display,div.rui-colorpicker div.preview,div.rui-colorpicker div.rgb-display,div.rui-colorpicker input.rui-ui-button{font-size:100%;display:block;width:auto;padding:0 .2em}div.rui-colorpicker input.display,div.rui-colorpicker div.preview,div.rui-colorpicker div.rgb-display input,div.rui-colorpicker input.rui-ui-button{border:1px solid #AAA;-moz-border-radius:.2em;-webkit-border-radius:.2em}div.rui-colorpicker div.field{width:150px;background-color:red;cursor:crosshair;margin-right:1.2em}div.rui-colorpicker div.field div.pointer{background-position:-170px 0;margin-left:-2px;margin-top:-2px}div.rui-colorpicker div.colors{width:16px;background-position:-150px 0;border-color:#EEE;cursor:pointer;margin-right:.6em}div.rui-colorpicker div.colors div.pointer{cursor:default;background-position:-170px -20px;margin-left:-8px;margin-top:-3px}div.rui-colorpicker div.controls{width:5em}div.rui-colorpicker div.preview{height:2em;background:white;border-color:#BBB}div.rui-colorpicker input.display{margin-top:.5em;background:#FFF;width:4.5em}div.rui-colorpicker div.rgb-display{padding:0;text-align:right;margin-top:.5em}div.rui-colorpicker div.rgb-display label{display:inline}div.rui-colorpicker div.rgb-display label:after{content:none}div.rui-colorpicker div.rgb-display input{vertical-align:top;font-size:100%;width:2em;text-align:right;margin-left:.2em;padding:0 .2em;background:#FFF;margin-bottom:1px;display:inline}div.rui-colorpicker div.rui-button{cursor:pointer;position:absolute;bottom:0;right:0;width:4em}div.rui-colorpicker-inline{display:inline-block; *display:inline; *zoom:1;position:relative;box-shadow:none;-moz-box-shadow:none;-webkit-box-shadow:none;z-index:auto}</style>');
return g}(document,Math,parseInt,RightJS);
