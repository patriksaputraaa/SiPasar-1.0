$(function () {
    const apiBaseUrl = "http://localhost:8000/";
    const url = window.location.search;
    const urlParams = new URLSearchParams(url);
 
    function makeCookies(data) {
        Object.keys(data).forEach(function(key) {
            var val = data[key];
            document.cookie = key+"="+val+"; path=/";
        });
    }
    function getCookies(data) {
        var cookie = document.cookie;
        var cookies = cookie.split('; ');

        if(data == undefined) {
            var values = {};
            $.each(cookies, function (index, val) {
                var key = val.split('=')[0];
                var value = val.split('=')[1];
                values[key] = value;
            });
            return values;
        } else {
            if(Array.isArray(data)) {
                var values = {};
                $.each(cookies, function (index, val) {
                    $.each(data, function (index2, val2) {
                        var key = val.split('=')[0];
                        var value = val.split('=')[1];
                        if(key == val2) {
                            values[key] = value;
                        }
                    })
                });
                return values;
            } else {
                var values;
                $.each(cookies, function (index, val) {
                    var key = val.split('=')[0];
                    var value = val.split('=')[1];
                    if(key == data) {
                        values = value;
                        return;
                    }
                });
                return values;
            }
        }
    }
    function deleteCookies(data) {
        if(data == undefined) {
            var cookie = document.cookie;
            var cookies = cookie.split('; ');

            $.each(cookies, function (index, val) {
               var key = val.split('=')[0];
               document.cookie = key+"=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            });
        } else {
            if(!Array.isArray(data)) {
                document.cookie = data+"=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
            } else {
                $.each(data, function (index, val) {
                    document.cookie = val+"=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
                })
            }
        }
    }

    $(document).ready(function () {
        var id = urlParams.get('id');
        if(id == null) {
            window.location = "./";
        }
        if($('.year').length) {
            $('.year').html(new Date().getFullYear());
        }
        $.ajax({
            url: apiBaseUrl+'pasar/detail/getone/'+id,
            type: 'GET'
        })
        .done(function(data) {
            console.log(data);
            var map = L.map('map-detail').setView([data.pasar.latitude, data.pasar.longitude], 13);
            map.attributionControl.addAttribution('&copy; <span class="year"></span> Tim Penelitian SiPasar');
            
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            var lmarker = L.marker([data.pasar.latitude, data.pasar.longitude]).bindTooltip(data.pasar.nama_pasar);
            lmarker.addTo(map);

            $("main #nama-pasar").text(data.pasar.nama_pasar);

            if (data.pasar.deskripsi_pasar != null) {
                $("main #deskripsi-pasar").append("<p>"+data.pasar.deskripsi_pasar+"</p>");
            } else {
                $("main #deskripsi-pasar").remove();
            }

            if(data.keterangan.length != 0) {
                var tag = "<ul>";
                for (let element of data.keterangan) {
                    tag += "<li>"+element.keterangan+"</li>";
                }
                tag += "</ul>";
                $("main #deskripsi-pasar").append(tag);
            }

            if (data.pasar.sejarah_pasar != null) {
                $("main #sejarah-pasar").append("<p>"+data.pasar.sejarah_pasar+"</p>");
            } else {
                $("main #sejarah-pasar").remove();
            }

            /*AFL: Tambah foto */
            if(data.fotosejarah.length > 0) {
                var tagsejarahfoto = "";
                for (let element of data.fotosejarah) {
                    if(element.nama_file_sejarah != null) {
                        if(data.fotosejarah.length == 1){
                            tagsejarahfoto += "<div class='satufotosejarah'>"
                            + "<figure><img src='"+apiBaseUrl+"fotopasar/"+element.nama_file_sejarah+"' "
                            + "alt='"+element.caption_sejarah+"' style='width:50%'>";
                        }
                        else{
                            tagsejarahfoto += "<div>"
                        + "<figure><img src='"+apiBaseUrl+"fotopasar/"+element.nama_file_sejarah+"' "
                        + "alt='"+element.caption_sejarah+"' style='width:80%'>";
                        }
                        
                        tagsejarahfoto += "<figcaption >"+element.caption_sejarah+" </br> <i>(Sumber: Arsip Kota Yogyakarta)</i></figcaption></figure>"
                        + "</div> ";
                    }
                }
                $("main #foto-pasar-sejarah").append(tagsejarahfoto);
            } else{
                $("main #foto-pasar-sejarah").remove();
            }
            /*AFL: Tambah foto */
            /*
            if(data.fotosejarah.length != 0) {
                var tagsejarah = "";
                for (let element of data.fotosejarah) {
                    if(element.nama_file_sejarah == null) {
                        alert(element.nama_file_sejarah);
                        tagsejarah += "<div><img src='"+apiBaseUrl+"fotopasar/no-image.png' alt='"+element.caption_sejarah+"'></div>";
                    } else{
                        tagsejarah += "<div><img src='"+apiBaseUrl+"fotopasar/"+element.nama_file_sejarah+"' alt='"+element.caption_sejarah+"'></div>";
                    }
                }
                $("main #foto-pasar-sejarah .owl-carousel").append(tagsejarah);
            } else {
                $("main #foto-pasar-sejarah").remove();
            }
            */
            /*AFL: Tambah foto */

            if(data.tag.length != 0) {
                var tag = "<p>";
                for (let element of data.tag) {
                    tag += element.tag+", ";
                }
                tag += "</p>";
                $("main #khas-pasar").append(tag);
            } else {
                $("main #khas-pasar").remove();
            }

            if(data.kios.length != 0) {
                var tag = "<ol>";
                for (let element of data.kios) {
                    tag += "<li>"+element.nama_kios+(element.lokasi_kios != null ? ", "+element.lokasi_kios : '')+"</li>";
                }
                tag += "</ol>";
                $("main #kios-pasar").append(tag);
            } else {
                $("main #kios-pasar").remove();
            }

            if(data.fasilitas.length != 0) {
                var tag = "";
                for (let element of data.fasilitas) {
                    tag += "<li>"+element.fasilitas+"</li>";
                }
                $("main #fasilitas-pasar").append(tag);
            } else {
                $("main #fasilitas-pasar").remove();
            }
           
            if (data.pasar.is_denah == 1) 
                $("main #denah-pasar").append('<a class="h4" href="./denah.html?pasar='+id+'&lantai=1">Lihat Denah Pasar</a>');
            else
                $("main #denah-pasar").append('<h5 class="denahnotav">Denah Pasar Belum Tersedia</h5>');
            

            if(data.foto.length != 0) {
                var tag = "";
                for (let element of data.foto) {
                    if(element.nama_file == null) {
                        tag += "<div><img src='"+apiBaseUrl+"fotopasar/no-image.png' alt='"+element.fasilitas+"'></div>";
                    } else{
                        tag += "<div><img src='"+apiBaseUrl+"fotopasar/"+element.nama_file+"' alt='"+element.fasilitas+"'></div>";
                    }
                }
                $("main #foto-pasar .owl-carousel").append(tag);
            } else {
                $("main #foto-pasar").remove();
            }

            $(".owl-carousel").owlCarousel({
                stagePadding: 50,
                margin: 20,
                /*
                loop:($(".owl-carousel .item").length > 2) ? true: false,
                center: ($(".owl-carousel .item").length > 2) ? true: false,
                */
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                responsive:{
                    0:{
                        items: 1
                    },
                    768:{
                        items: 2
                    },
                    1200:{
                        items: 4
                    }
                }
            });
            
            $("figure").css({
                "text-align": "center",
                "width": "50%",
                "float": "left",
                "margin": "0",
                "text-align": "center",
                "padding" : "5px"
            })
            
            $(".satufotosejarah figure").css({
                "width": "100%"
            })

            $(".preload").css("top","-100vh");
        })
        .fail(function(fail) {
            console.log(fail.responseText);
        });


        // $('#svgnya').attr('data', apiBaseUrl+'svgpasar/all.svg');
        // $.ajax({
        //     url: apiBaseUrl+'pasar/getpasarkios',
        //     type: 'GET'
        // })
        // .done(function(data) {
            
        // })
        // .fail(function(fail) {
        //     console.log(fail);
        // });
    });
});