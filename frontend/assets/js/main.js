$(function () {
    const apiBaseUrl = "http://localhost:8000/";
    var map;
    var marker = [];

    function addMarker(dataa) {
        $.each(marker, function (index, val) {
            map.removeLayer(val);
        })
        marker = [];
        $.each(dataa.pasar, function (index, val) {
            var lmarker = L.marker([val.latitude, val.longitude]).bindTooltip(val.nama_pasar).on('click', function (event) {
                addPasarResult(val.id_pasar);
            });
            if(!checkMarkerExist(lmarker)) {
                lmarker.addTo(map);
                marker.push(lmarker);
            }
        });
        $(".preload").css("top","-100vh");
    }
    function checkMarkerExist(lmarker) {
        var exist = false;
        $.each(marker, function (index, val) {
            if(val.getLatLng().lat == lmarker.getLatLng().lat && val.getLatLng().lng == lmarker.getLatLng().lng) {
                exist = true;
                return;
            }
        });
        return exist;
    }
    function addSearchResult(data) {
        var kios = data.kios;
        var tags = data.tags;
        var pasar = data.pasar;
        makeCookies({kios: JSON.stringify(kios)});
        var market = [];

        var stringtag = "<h1>Hasil Pencarian</h1>";
        $.each(pasar, function (index, val) {
            var marketexist = false;
            $.each(market, function (index2, val2) {
                if(val.id_pasar == val2.id_pasar) {
                    marketexist = true;
                    return;
                }
            });
            if(!marketexist) {
                var number = 0;
                stringtag += '<div class="search-result" idpasar="'+val.id_pasar+'">'+
                    '<hr>'+
                    '<h4>'+val.nama_pasar+'</h4>'+
                    '<p class="alamat">'+val.alamat_pasar+'</p>';
                $.each(tags, function(index2, val2) {
                    if(val.id_pasar == val2.id_pasar) {
                        if(number == 0) {
                            stringtag +='<p>Di pasar ini tersedia :</p>'+
                                '<ul class="stand">';
                            number++;
                        }
                        stringtag += '<li>'+val2.tag+'</li>';
                    };
                    if(tags.length == (index2+1) && number != 0) {
                        stringtag += '</ul>';
                    }
                });
                number = 0;
                $.each(kios, function (index2, val2) {
                    if(val.id_pasar == val2.id_pasar) {
                        if(number == 0) {
                            stringtag +='<p>Kios yang tersedia :</p>'+
                                '<ul class="stand">';
                            number++;
                        }
                        stringtag += '<li>'+val2.nama_kios+'</li>';
                    };
                    if(kios.length == (index2+1) && number != 0) {
                        stringtag += '</ul>';
                    }
                });
                stringtag += '</div>';
                market.push(val);
            }
        });
        $("aside > .content").html(stringtag);
        $("aside").addClass("active");
        $("aside > .aside-toggler").show();
        $("aside > .aside-toggler > .fa-chevron-left").removeClass("fa-rotate-180");
    }
    function addPasarResult(id_pasar) {
        $("aside").addClass("active");
        $("aside > .loading").fadeIn(200);
                
        $.ajax({
            url: apiBaseUrl+'pasar/getdesc/'+id_pasar,
            type: 'GET'
        })
        .done(function(data) {
            var stringtag = "";

            var datakey = getCookies('key');
            if(datakey != undefined && datakey != "") {
                stringtag += "<button class='mb-3 btn btn-outline-primary' id='pencarian-back'>Kembali ke pencarian</button>";
            }

            if(data.pasar.nama_pasar != null) {
                stringtag += "<h1>"+data.pasar.nama_pasar+"</h1>";
            }

            stringtag += "<hr>" +
            "<table>";
            
            if(data.pasar.kelas_pasar != null) {
                stringtag += "<tr>" +
                "<td class='text-center'><span class='fas fa-sitemap'></span><br>Kelas Pasar</td>" +
                "<td>"+data.pasar.kelas_pasar+"</td>" +
                "</tr>";
            }
            if(data.nama_lain.length != 0) {
                stringtag += "<tr>" +
                "<td class='text-center'><span class='fas fa-signature'></span><br>Nama Lain</td>" +
                "<td>";
                    for (let i = 0; i < data.nama_lain.length; i++) {
                        stringtag += data.nama_lain[i].nama_lain+"<br>";
                    }
                stringtag += "</td>" +
                "</tr>";
            }
            if(data.pasar.alamat_pasar != null) {
                stringtag += "<tr>" +
                "<td class='text-center'><span class='fas fa-map-marker-alt'></span><br>Lokasi</td>" +
                "<td>"+data.pasar.alamat_pasar+"</td>" +
                "</tr>";
            }
            if(data.pasar.kecamatan_pasar != null || data.pasar.kodepos != null) {
                stringtag += "<tr>" +
                "<td class='text-center'><span class='fas fa-compass'></span><br>Kecamatan, Pos</td>" +
                "<td>"+data.pasar.kecamatan_pasar+", "+data.pasar.kodepos+"</td>" +
                "</tr>";
            }
            if(data.pasar.instagram != null) {
                stringtag += "<tr>" +
                "<td class='text-center'><span class='fab fa-instagram'></span><br>Instagram</td>" +
                "<td><a href='"+data.pasar.instagram+"'>"+data.pasar.instagram+"</a></td>" +
                "</tr>";
            }
            
            var datakios = getCookies('kios');
            stringtag += "</table>";
            if(datakios != undefined) {
               
                var kios = JSON.parse(datakios);
                var jumlah = 0;
                    $.each(kios, function (index2, val2) {
                        if(data.pasar.nama_pasar == val2.nama_pasar) {
                            if(jumlah == 0) {
                                stringtag += "<hr>"+
                                    "<h5>Kios</h5>"+
                                    "<table>";
                                stringtag += '<tr>'+
                                    '<th class="text-center">Tags</th>'+
                                    '<th>Nama Kios</th>'+
                                    '</tr>';
                            }
                            jumlah++;
                            stringtag += '<tr>'+
                                '<td class="text-center">'+
                                val2.tag+
                                '</td>'+
                                '<td>'+
                                val2.nama_kios+
                                '</td>'+
                                '</tr>';
                        }
                    });
                stringtag += "</table>";
            }
            stringtag += "<div class='text-center pt-5'>" +
                "<a href='detail.html?id="+data.pasar.id_pasar+"' class='btn btn-outline-primary'>Info Detil</a>" +
                "</div>";
            $("aside > .content").html(stringtag);
            $("aside > .loading").fadeOut(200);
            $("aside > .aside-toggler").show();
            $("aside > .aside-toggler > .fa-chevron-left").removeClass("fa-rotate-180");
        })
        .fail(function(fail) {
            console.log(fail);
        });
    }
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

    $("aside").on("click", ".aside-toggler", function (event) {
        event.preventDefault();
        if($(this).parent().hasClass("active")) {
            $(this).parent().removeClass("active");
            $(this).children(".fa-chevron-left").addClass("fa-rotate-180");
        } else {
            var datakey = getCookies('key');
            if(datakey == undefined || datakey == "") {
                $("aside #pencarian-back").remove();
            }
            $(this).parent().addClass("active");
            $(this).children(".fa-chevron-left").removeClass("fa-rotate-180");
        }
    });

    $("aside").on("click", ".search-result", function (event) {
        event.preventDefault();
        var id_pasar = $(this).attr('idpasar');
        addPasarResult(id_pasar);
    });

    $("aside").on("click", "#pencarian-back", function (event) {
        event.preventDefault();
        $("aside > .loading").fadeIn(200);
        var key = getCookies('key');
        $.ajax({
            url: apiBaseUrl+'pasar/getkey',
            type: 'POST',
            data: {
                key: key
            }
        })
        .done(function (data) {
            addSearchResult(data);
            addMarker(data);
            $("aside > .loading").fadeOut(200);
        })
        .fail(function(fail) {
            console.log("fail");
            console.log(fail);
        });
    });

    $("#pencarian").on("submit", function (event) {
        event.preventDefault();
        $(this).children("input").blur();
        $(".preload").css("top","0");
        makeCookies({key: $(this).children("input").val()});
        if($(this).children("input").val() == "") {
            $.ajax({
                url: apiBaseUrl+'pasar/getlonlan',
                type: 'GET'
            })
            .done(function(data) {
                $("aside").removeClass("active");
                $("aside > .aside-toggler > .fa-chevron-left").addClass("fa-rotate-180");
                addMarker(data);
            })
            .fail(function(fail) {
                console.log(fail);
            });
        } else {
            $.ajax({
                url: apiBaseUrl+'pasar/getkey',
                type: 'POST',
                data: $(this).serialize()
            })
            .done(function (data) {
                addSearchResult(data);
                addMarker(data);
            })
            .fail(function(fail) {
                console.log(fail.responseText);
            });
        }
    });
    
    $(document).ready(function () {
        if($('#map').length) {
            map = L.map('map').setView([-7.800000, 110.374659], 13);

            map.attributionControl.addAttribution('&copy; <span class="year"></span> Tim Penelitian SiPasar');
            
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);
            $.ajax({
                url: apiBaseUrl+'pasar/getlonlan',
                type: 'GET'
            })
            .done(function(data) {
                addMarker(data);
            })
            .fail(function(fail) {
                console.log(fail);
            });
        }
        if($('.year').length) {
            $('.year').html(new Date().getFullYear());
        }
    });

});
