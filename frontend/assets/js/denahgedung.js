const apiBaseUrl = "http://localhost:8000/";

const url = window.location.search;
const urlParams = new URLSearchParams(url);

var pasar = urlParams.get('pasar');
var lantai = urlParams.get('lantai');
var gedung = urlParams.get('gedung');


$(document).ready(function () {  
    $.ajax({
        url: apiBaseUrl+'pasar/denah/getdenahgedung/'+pasar+'/'+lantai+'/'+gedung.split('-')[2],
        type: 'GET'
    })
    .done(function(data) {
        
        $(".preload").css("top","-100vh");
 
        $("main #nama-pasar").text(data.pasar.nama_pasar);
        $("main #message").append("<p class='back'><a href='denah.html?pasar="+pasar+"&lantai="+lantai+"'><i class='fas fa-chevron-circle-left'></i> Kembali ke halaman Denah Pasar</a></p>");
        if(data.kios.length != 0) {
            var tag = "<ol>";
            for (let element of data.kios) {
                if($("object").contents().find("#"+ element.kode_svg).length>0)
                    tag += "<li> <span class='spanlink link-primary' id='" + element.kode_svg + "' onclick='test(this);' > "+element.nama_kios+"</span>"+(element.lokasi_kios != null ? ", "+element.lokasi_kios : '')+"</li>";
                else if($("object").contents().find("."+ element.kode_svg).length>0)
                    tag += "<li> <span class='spanlink link-primary' id='" + element.kode_svg + "' onclick='test(this);' > "+element.nama_kios+"</span>"+(element.lokasi_kios != null ? ", "+element.lokasi_kios : '')+"</li>";
                else  tag += "<li> <span class='link-secondary' id='" + element.kode_svg + "' > "+element.nama_kios+"</span>"+(element.lokasi_kios != null ? ", "+element.lokasi_kios : '')+"</li>";
            }
            tag += "</ol>";
            $("main #kios-pasar").append(tag);
        } else {
            $("main #kios-pasar").remove();
        }    

    })
    .fail(function(fail) {
        console.log(fail);
    });
});

 
var o = document.body.getElementsByTagName("object")[0];
o.setAttribute("data", "assets/denahpasar/pasar"+pasar+"/lantai"+lantai+"/"+gedung+".svg");
function test( kode){
    //document.getElementById(kode.id).classList.add('link-danger');
    //window.scrollTo(0,0);
    document.getElementById('nama-pasar').scrollIntoView(); 
    $("object").contents().find(".blok").removeClass("blokcolor");
    if(($("object").contents().find("#"+ kode.id)).length > 0) 
        $("object").contents().find("#"+ kode.id).addClass("blokcolor");
    else if(($("object").contents().find("."+ kode.id)).length > 0) 
        $("object").contents().find("."+ kode.id).addClass("blokcolor");
    else alert("Kios belum ada di denah");

}
$(window).on('load', function(){

    

    $("object").contents().find(".blok").hover(function(){
      
        if(this.id.includes("*"))
            $("object").contents().find("."+this.id.split("*")[0]).addClass("blokcolor");
        else
            $(this).addClass("blokcolor");
    });

    $("object").contents().find(".blok").mouseleave(function(){ 
        if(this.id.includes("*"))
            $("object").contents().find("."+this.id.split("*")[0]).removeClass("blokcolor");
        else
            $(this).removeClass("blokcolor");
        $('#kiosModal').modal('hide');
    });

    $("object").contents().find(".blok").click(function(){
        $(".preload").css("top","0");
        var kios = this.id.split("*")[0];
        //alert(kios);
        $.ajax({
            url: apiBaseUrl+'pasar/getpasarkiosdetail/'+pasar+'/'+lantai+'/'+kios,
            type: 'GET'
        })
        .done(function(data) {
            
            $(".preload").css("top","-100vh");
            
            $('#ModalBody').children("p").remove();
            $('#ModalBody').children("img").remove();
           
            $('#ModalLabel').text(data.nama_pasar);
            $('#ModalBody').append("<p>Nama Kios: " + data.nama_kios + "</p>");
            
            if(data.lokasi_kios != null)
                $('#ModalBody').append("<p>Lokasi Kios: " + data.lokasi_kios + "</p>");
            if(data.foto_kios != null)
                $('#ModalBody').append("<img src='"+apiBaseUrl+"/fotokios/"+data.foto_kios+"' alt='' width='100%'>");
            
            $('#kiosModal').modal('show');
    
        })
        .fail(function(fail) {
            console.log(fail);
        });
 
   
    });

    
});
