$(document).ready(function(){jQuery.easing.def="easeInOutBack"}),$(function(){$("html").on("touchstart mousedown",function(){$(".article_bubble").hide("fast"),$(".article_bubble").remove()}),$(".article_bubble_trigger").on("touchstart",function(e){e.stopPropagation(),$(".article_bubble").remove();for(var t=0;gon.vocab.length>t;t++){var n=gon.vocab[t];$(this).attr("id")==n.word&&$(this).append('<p class="article_bubble">'+n.translation+"</p>")}for(var t=0;gon.culture_notes.length>t;t++){var n=gon.culture_notes[t];$(this).attr("id")==n.title&&$(this).append('<p class="article_bubble">'+n.body+"</p>")}$(".article_bubble").css({position:"fixed",bottom:"0",left:"0",fontSize:"130%",padding:"20px 40px 20px 20px",margin:"0",width:"100%",opacity:"0.95",backgroundColor:"#6f8500",color:"#fff",zIndex:"200"}),$(".article_bubble").hide(),$(".article_bubble").show("fast")})});