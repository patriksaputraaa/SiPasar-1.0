
const apiBaseUrl = "http://localhost:8000/";
const url = window.location.search;
const urlParams = new URLSearchParams(url);

var pasar = urlParams.get('pasar');
var lantai = urlParams.get('lantai');

$(document).ready(function () {
    $.ajax({
        url: apiBaseUrl+'pasar/denah/getdenah/'+pasar+'/'+lantai,
        type: 'GET'
    })
    .done(function(data) {
        
        $(".preload").css("top","-100vh");
 
        $("main #nama-pasar").text(data.pasar.nama_pasar);

        for(var i=1; i<=data.pasar.jumlah_lantai; i++){
            if(i==lantai)
                $("main #nav-lantai").append("<a id='lantai-"+i+"' class='btn active' title='Lihat denah Lantai "+i+"' href='#' onclick='lantaiAlert()'>Lantai "+i+"</a>");
            else
                $("main #nav-lantai").append("<a id='lantai-"+i+"' class='btn tablinks' title='Lihat denah Lantai "+i+"' href='denah.html?pasar="+data.pasar.id_pasar+"&lantai="+i+"' >Lantai "+i+"</a>");
        }

        if(data.pasar.is_denah==0){
            $("main #message").append("<p>Data Denah Pasar Tidak ditemukan. Klik <a href='detail.html?id="+pasar+"'>di sini</a> untuk kembali ke halaman Detail pasar.</p>");
            $("object").remove();
        }
        else
            $("main #message").append("<p class='back'><a href='detail.html?id="+pasar+"'><i class='fas fa-chevron-circle-left'></i> Kembali ke halaman Detail pasar</a></p>");
            

    })
    .fail(function(fail) {
        console.log(fail);
    });
});

var o = document.body.getElementsByTagName("object")[0];
o.setAttribute("data", "assets/denahpasar/pasar"+pasar+"/lantai"+lantai+"/all.svg");

$("#lantai-"+lantai).css("color", "red");

$(window).on('load', function(){
// alert($("object").contents().find(".blok"));
    $("object").contents().find(".blok").on("mouseenter", function(){
        $(this).addClass("blokred");
    });

    $("object").contents().find(".blok").on("mouseleave", function(){   
        $(this).removeClass("blokred");
    });

    $("object").contents().find(".blok").on("click", function(){
        window.location.href = "denahgedung.html?pasar="+pasar+"&lantai="+lantai+"&gedung="+$(this).attr('id');
    });
});

function lantaiAlert(){
    alert("Anda sudah berada di lantai " +lantai );
}

