/**
 * Created by yuliang on 2015/8/21.
 */

function SlidingMenu(){
  var list = new Array();
  var _html = null;
  this.init = function(html){
      _html = html;

  }

    this.loadDiv=function(html){
        var slidingmenus = html.find(".slidingmenu");
        $.each(slidingmenus,function(){
            var div = $(this);
            var id = div.attr("id");
            var button = $('<button id="show_'+id+'" href="#'+id+'"  style="display:none">&nbsp;</button>');
            var closeBtns = div.find(".close-model");
            $.each(closeBtns,function(){
                var btn = $(this);
                btn.addClass("close-"+id);
            });
            $(html).append(button);
            list.push(id);
        });
        for(var i=0;i<list.length;i++){
            var id = list[i];
            _showModel('#show_'+id,id);
        }
    }
};