$(function () {
    const apiBaseUrl = "http://localhost:8000/";
    const baseUrl = "http://localhost:8081/frontend/";

    var pasarList;

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
                    var key = val.split('=')[0];
                    var value = val.split('=')[1];
                    $.each(data, function (index2, val2) {
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
        var cookie = document.cookie;
        var cookies = cookie.split('; ');

        if(data == undefined) {
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

    function getkhas() {
        $.ajax({
            url: apiBaseUrl+'admin/getkhas',
            type: 'GET'
        })
        .done(function(data) {
            if ($.fn.DataTable.isDataTable('#list table') ) {
                $('#list table').DataTable().destroy();
            }
            $('#list table tbody').children().remove();
            $('#nama_pasar').children().remove();
            $('#datalist-khas').children().remove();
            var nomornya = 0;
            data.pasar.forEach(value => {
                nomornya++;
                var tagtr = "<tr>";
                tagtr += "<td>"+nomornya+"</td>";
                tagtr += "<td>"+value.nama_pasar+"</td>";
                
                tagtr += "<td>";
                var num = 0;
                data.pasar_tag.forEach(element => {
                    if(element.id_pasar == value.id_pasar) {
                        num++;
                        tagtr += element.tag+", ";
                    }
                });
                tagtr = (num > 0) ? tagtr.slice(0, -2) : tagtr;
                
                        
                tagtr += "<td>";
                tagtr += "<a class='btn btn-warning detail-khas' href='#' id-pasar='"+value.id_pasar+"'>Edit</a>";
                tagtr += "</td>";

                tagtr += "</td>";

                tagtr += "</tr>";

                $('#list').find('tbody').append(tagtr);

                var tagslct = "<option value='"+value.id_pasar+"'>"+value.nama_pasar+"</option>";
                $('#nama_pasar').append(tagslct);
            });
            data.tag.forEach(element => {
                var tagdtlst = "<option value='"+element.tag+"'>";
                $('#datalist-khas').append(tagdtlst);
            });
            $('#list table').DataTable();
        })
        .fail(function(fail) {
            console.log(fail.responseText);
        });
    }

    function getkios() {
        $.ajax({
            url: apiBaseUrl+'admin/getkios',
            type: 'GET'
        })
        .done(function(data) {
            if ($.fn.DataTable.isDataTable('#list table') ) {
                $('#list table').DataTable().destroy();
            }
            $('#list table tbody').children().remove();
            $('#nama_pasar').children().remove();
            $('#datalist-khas').children().remove();
            var nomornya = 0;
            data.pasar.forEach(value => {
                data.kios.forEach(kios => {
                    if(value.id_pasar == kios.id_pasar) {
                        nomornya++;
                        var tagtr = "<tr>";
                        tagtr += "<td>"+nomornya+"</td>";
                        tagtr += "<td>"+value.nama_pasar+"</td>";
                        tagtr += "<td>"+kios.nama_kios+"</td>";
                        
                        tagtr += "<td>";
                        tagtr += "<a class='btn btn-primary detail-kios' href='#' id-kios='"+kios.id_pasar_kios+"'>Lihat Detail</a>";
                        tagtr += "<a class='btn btn-danger hapus-kios' onclick="+'"return confirm('+"'Apakah anda yakin?'"+')"'+" href='#' id-kios='"+kios.id_pasar_kios+"'>Hapus</a>";
                        tagtr += "</td>";
                        
                        tagtr += "</tr>";
                        
                        $('#list').find('tbody').append(tagtr);
                    } 
                });

                var tagslct = "<option value='"+value.id_pasar+"'>"+value.nama_pasar+"</option>";
                $('#nama_pasar').append(tagslct);
                $('#nama_pasar_detail').append(tagslct);
            });
            data.tag.forEach(element => {
                var tagdtlst = "<option value='"+element.tag+"'>";
                $('#datalist-khas').append(tagdtlst);
            });
            $('#list table').DataTable();
        })
        .fail(function(fail) {
            console.log(fail.responseText);
        });
    }

    function getutama() {
        $.ajax({
            url: apiBaseUrl+'admin/getutama',
            type: 'GET'
        })
        .done(function(data) {
            if ($.fn.DataTable.isDataTable('#list table') ) {
                $('#list table').DataTable().destroy();
            }
            $('#list').find('tbody').children().remove();
            
            var nomornya = 0;
            data.pasar.forEach(value => {
                nomornya++;
                var aktifnya = (value.is_aktif == '1') ? 'Aktif' : 'Tidak Aktif';

                var tagtr = "<tr>";
                tagtr += "<td>"+nomornya+"</td>";
                tagtr += "<td>"+value.nama_pasar+"</td>";
                tagtr += "<td>"+value.kelas_pasar+"</td>";
                tagtr += "<td>"+value.alamat_pasar+"</td>";
                tagtr += "<td>"+aktifnya+"</td>";
                tagtr += "<td>";
                tagtr += "<a class='btn btn-primary detail-pasar' href='#' id-pasar='"+value.id_pasar+"'>Lihat Detail</a>";
                tagtr += "</td>";
                tagtr += "</tr>";

                $('#list').find('tbody').append(tagtr);
            });
            
            $('#list table').DataTable();
        })
        .fail(function(fail) {
            console.log(fail.responseText);
        });
    }

    function getgedung() {
        $.ajax({
            url: apiBaseUrl+'admin/getgedung',
            type: 'GET'
        })
        .done(function(data) {
            if ($.fn.DataTable.isDataTable('#list table') ) {
                $('#list table').DataTable().destroy();
            }
            $('#list').find('tbody').children().remove();
            $('#nama_pasar').children().remove();
            $('#lantai_pasar').children().remove();

            pasarList = data.pasar;
            var nomornya = 0;
            data.gedung.forEach(value => {
                nomornya++;
                var tagtr = "<tr>";
                tagtr += "<td>"+nomornya+"</td>";
                tagtr += "<td>"+value.nama_pasar+"</td>";
                tagtr += "<td>"+value.lantai+"</td>";
                tagtr += "<td>"+value.nama_gedung+"</td>";
                tagtr += "<td>";
                tagtr += "<a class='btn btn-danger hapus-gedung' onclick="+'"return confirm('+"'Apakah anda yakin?'"+')"'+" href='#' id-gedung='"+value.id_pasar_lantai+"'>Hapus</a>";
                tagtr += "</td>";
                tagtr += "</tr>";

                $('#list').find('tbody').append(tagtr);
            });
            
            data.pasar.forEach(value => {
                var tagslct = "<option value='"+value.id_pasar+"'>"+value.nama_pasar+"</option>";
                $('#nama_pasar').append(tagslct);
            });

            var jumlahLantai = data.pasar[0].jumlah_lantai;
            for(var i=1; i<=jumlahLantai; i++) {
                var tagslct = "<option value='"+i+"'>Lantai "+i+"</option>";
                $('#lantai_pasar').append(tagslct);
            }
            
            $('#list table').DataTable();
        })
        .fail(function(fail) {
            console.log(fail.responseText);
        });
    }

    function getfoto() {
        $.ajax({
            url: apiBaseUrl+'admin/getfoto',
            type: 'GET'
        })
        .done(function(data) {
            if ($.fn.DataTable.isDataTable('#list table') ) {
                $('#list table').DataTable().destroy();
            }
            $('#list').find('tbody').children().remove();
            
            var nomornya = 0;
            data.pasar.forEach(value => {
                nomornya++;

                var tagtr = "<tr>";
                tagtr += "<td>"+nomornya+"</td>";
                tagtr += "<td>"+value.nama_pasar+"</td>";
                tagtr += "<td>"+value.jumlah_foto+"</td>";
                tagtr += "<td>";
                tagtr += "<a class='btn btn-primary tambah-foto' href='#' id-pasar='"+value.id_pasar+"'>Lihat Detail</a>";
                tagtr += "</td>";
                tagtr += "</tr>";

                $('#list').find('tbody').append(tagtr);
            });
            
            $('#list table').DataTable();
        })
        .fail(function(fail) {
            console.log(fail.responseText);
        });
    }

    $("#logout-link").on("click", function (event) {
        event.preventDefault();
        deleteCookies(['token', 'nama']);
        window.location.replace("./../login.html");
    });

    $('#alert-spot').on('click', function (event) {
        event.preventDefault();
        $(this).html('');
    })
    
    $('#btn-tambah').on('click', function (event) {
        event.preventDefault();
        $('input').val('');
        $('#detail').slideUp(200);
        $('#list').slideToggle(200);
        $('#form-tambah').slideToggle(200);
        $('#btn-tambah').toggleClass('active');
    });

    $("#detail").on('click', "#btn-kembali", function (event) {
        event.preventDefault();
        $('#btn-tambah').slideDown(200);
        $('#list').slideDown(200);
        $('#form-tambah').slideUp(200);
        $('#detail').slideUp(200);
        $('input').val('');
    })

    $('#tambah-khas-pasar').on('click', function (event) {
        event.preventDefault();
        var tag = '<div class="input-group mb-2"><input type="text" name="khas_pasar[]" list="datalist-khas" class="khas-pasar form-control" placeholder="contoh. bakso"><span class="input-group-text rmv-khas-pasar"><span class="far fa-times-circle"></span></span></div>';
        $('#khas_pasar').append(tag);
    });

    $('#tambah-khas-pasar-detail').on('click', function (event) {
        event.preventDefault();
        var tag = '<div class="input-group mb-2"><input type="text" name="khas_pasar[]" list="datalist-khas" class="khas-pasar-detail form-control" placeholder="contoh. bakso"><span class="input-group-text rmv-khas-pasar"><span class="far fa-times-circle"></span></span></div>';
        $('#khas_pasar_detail').append(tag);
    });

    $('#khas_pasar').on('click', '.rmv-khas-pasar', function (event) {
        event.preventDefault();
        if($('#khas_pasar').children('.input-group').length > 1) {
            var indexnya = $(this).index('#khas_pasar .rmv-khas-pasar');
            $('#khas_pasar').find('.input-group')[indexnya].remove();
        }
    });
    
    $('#khas_pasar_detail').on('click', '.rmv-khas-pasar', function (event) {
        event.preventDefault();
        if($('#khas_pasar_detail').children('.input-group').length > 1) {
            var indexnya = $(this).index('#khas_pasar_detail .rmv-khas-pasar');
            $('#khas_pasar_detail').find('.input-group')[indexnya].remove();
        }
    });

    $(document).ready(function () {
        var token = getCookies("token");
        var nama = getCookies("nama");
        if(token == undefined) {
            window.location.replace("./../login.html");
        } else {
            $("#user-link").text('Selamat Datang, ' + nama);
            $.ajax({
                url: apiBaseUrl+'getuser',
                type: 'POST',
                data: {
                    token: token
                }
            })
            .done(function(data) {
                if(data.id_user == undefined) {
                    deleteCookies(['token', 'nama']);
                    window.location.replace("./../login.html");
                }
            })
            .fail(function(fail) {
                console.log(fail.responseText);
            });

            alert(window.location.href + ' ' + baseUrl+'admin/')

            if(window.location.href == baseUrl+'admin/' || window.location.href == baseUrl+'admin/index.html') {
                
                $.ajax({
                    url: apiBaseUrl+'admin/getdashboard',
                    type: 'GET'
                })
                .done(function(data) {
                    $('#jumlah-pasar').text(data.pasar.length);
                    $('#pasar-aktif').text(data.pasar_aktif.length);
                    $('#jumlah-khas').text(data.khas.length);
                })
                .fail(function(fail) {
                    console.log(fail.responseText);
                });
            } else if(window.location.href == baseUrl+'admin/khas.html') {
                getkhas();
                
                $("#list").on('click', ".detail-khas", function (event) {
                    event.preventDefault();
                    var element = $(this);
                    var id = element.attr('id-pasar');
                    $('#btn-tambah').slideUp(200);
                    $('#list').slideUp(200);
                    $('#form-tambah').slideUp(200);
                    $('#detail').slideDown(200);
                    $.ajax({
                        url: apiBaseUrl+'admin/getonekhas/'+id,
                        type: 'GET'
                    })
                    .done(function(data) {
                        $("#id-pasar").val(data.pasar.id_pasar);

                        $('#khas_pasar_detail .input-group').remove();
                        data.tag.forEach(element => {    
                            var tag = '<div class="input-group mb-2"><input type="text" name="khas_pasar[]" value="'+element.tag+'" list="datalist-khas" class="khas-pasar form-control" placeholder="contoh. bakso"><span class="input-group-text rmv-khas-pasar"><span class="far fa-times-circle"></span></span></div>';
                            $("#khas_pasar_detail").append(tag);
                        });
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $('#detail > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    var khasPasar = $('#khas_pasar_detail').find('.input-group .khas-pasar');
                    for (element of khasPasar) {
                        if(element.value == '') {
                            $(this).find('#khas_pasar_detail').parent().append('<span class="text-danger">Khas pasar field is required</span>');
                            return;
                        }
                    }

                    $.ajax({
                        url: apiBaseUrl+'admin/editkhas',
                        type: 'POST',
                        data: $(this).serialize()
                    })
                    .done(function(data) {
                        getkhas();
                        $('input').val('');
                        $('#btn-tambah').slideDown(200);
                        $('#list').slideDown(200);
                        $('#form-tambah').slideUp(200);
                        $('#detail').slideUp(200);
                        var tag = "<div class='alert alert-success'>"
                            + "<span>Berhasil mengubah khas pada pasar!</span>"
                            + "</div>";
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $('#form-tambah > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    var khasPasar = $('#khas_pasar').find('.input-group .khas-pasar');
                    for (element of khasPasar) {
                        if(element.value == '') {
                            $(this).find('#khas_pasar').parent().append('<span class="text-danger">Khas pasar field is required</span>');
                            return;
                        }
                    }

                    $.ajax({
                        url: apiBaseUrl+'admin/addkhas',
                        type: 'POST',
                        data: $(this).serialize()
                    })
                    .done(function(data) {
                        getkhas();
                        $('input').val('');
                        $('#list').slideToggle(200);
                        $('#form-tambah').slideToggle(200);
                        $('#btn-tambah').toggleClass('active');
                        if(data == 'sudah ada') {
                            var tag = "<div class='alert alert-danger'>"
                                + "<span>Khas sudah ada pada pasar!</span>"
                                + "</div>";
                        } else {
                            var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil menambahkan khas pada pasar!</span>"
                                + "</div>";
                        }
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                })
            } else if(window.location.href == baseUrl+'admin/kios.html') {
                getkios();

                $("#list").on('click', ".detail-kios", function (event) {
                    event.preventDefault();
                    $('span.text-danger').remove();

                    var element = $(this);
                    var id = element.attr('id-kios');
                    $('#btn-tambah').slideUp(200);
                    $('#list').slideUp(200);
                    $('#form-tambah').slideUp(200);
                    $('#detail').slideDown(200);
                    $.ajax({
                        url: apiBaseUrl+'admin/getonekios/'+id,
                        type: 'GET'
                    })
                    .done(function(data) {
                        $("#id-kios-detail").val(data.kios.id_pasar_kios);
                        $("#nama_pasar_detail").val(data.kios.id_pasar);
                        $("#nama_kios_detail").val(data.kios.nama_kios);
                        $("#lokasi_kios_detail").val(data.kios.lokasi_kios);
                        $("#foto_kios_sebelumnya").attr('alt', data.kios.nama_kios);
                        if(data.kios.foto_kios==null || (data.kios.foto_kios===""))
                            $("#foto_kios_sebelumnya").attr('src', '#');
                        else $("#foto_kios_sebelumnya").attr('src', apiBaseUrl+'fotokios/'+data.kios.foto_kios);
                         
                        
                        $('#khas_pasar_detail .input-group').remove();
                        data.tag.forEach(element => {    
                            var tag = '<div class="input-group mb-2"><input type="text" name="khas_pasar[]" value="'+element.tag+'" list="datalist-khas" class="khas-pasar form-control" placeholder="contoh. bakso"><span class="input-group-text rmv-khas-pasar"><span class="far fa-times-circle"></span></span></div>';
                            $("#khas_pasar_detail").append(tag);
                        });
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $("#list").on('click', ".hapus-kios", function (event) {
                    event.preventDefault();
                    var element = $(this);
                    var id = element.attr('id-kios');
                    $.ajax({
                        url: apiBaseUrl+'admin/deletekios/'+id,
                        type: 'GET'
                    })
                    .done(function(data) {
                        getkios();
                        var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil menghapus kios!</span>"
                                + "</div>";
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $('#detail > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    var error=false;
                    var fotoKios = $('#foto_kios_detail').val().split('.');
                    var fd = new FormData(this);
                    if(!($('#foto_kios_detail').val() === '')){
                        if(fotoKios[fotoKios.length-1] != 'jpg' && fotoKios[fotoKios.length-1] != 'jpeg' && fotoKios[fotoKios.length-1] != 'png' && fotoKios[fotoKios.length-1] != 'gif') {
                            $('#foto_kios_detail').parent().append('<span class="text-danger">Foto kios hanya dapat mengunggah file png, jpg, jpeg, atau gif</span>');
                            error=true;
                        }

                        var files = $('#foto_kios_detail')[0].files;
                        fd.append('foto_kios', files[0]);
                        fd.append('foto_extension', fotoKios[fotoKios.length-1]);
                    }

                    var khasPasar = $('#khas_pasar_detail').find('.input-group .khas-pasar');
                    for (element of khasPasar) {
                        if(element.value === '') {
                            $(this).find('#khas_pasar_detail').parent().append('<span class="text-danger">Khas pasar harus diisi</span>');
                            error=true;
                            return;
                        }
                    }
                    var namaKios = $('#nama_kios_detail');
                    if(namaKios.val().trim()  === '') {
                        $('#nama_kios_detail').parent().append('<span class="text-danger">Nama kios harus diisi</span>');
                        error=true;
                    }
                    var lokasiKios = $('#lokasi_kios_detail');
                    if(lokasiKios.val().trim()  === '') {
                        $('#lokasi_kios_detail').parent().append('<span class="text-danger">Lokasi kios harus diisi</span>');
                        error=true;
                    }

                    if(error)return;
                    else{
                        $.ajax({
                            url: apiBaseUrl+'admin/editkios',
                            type: 'POST',
                            data: fd,
                            processData: false,
                            contentType: false
                        })
                        .done(function(data) {
                            getkios();
                            $('input').val('');
                            $('#btn-tambah').slideDown(200);
                            $('#list').slideDown(200);
                            $('#form-tambah').slideUp(200);
                            $('#detail').slideUp(200);
                            $("#foto_kios_sebelumnya").attr('src', '#');
                            var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil mengubah kios pada pasar!</span>"
                                + "</div>";
                            $('#alert-spot').html(tag);
                        })
                        .fail(function(fail) {
                            console.log(fail.responseText);
                        });
                    }
                });

                $('#form-tambah > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    var fd = new FormData(this);
                    var error=false;
                    if(!($('#foto_kios').val() === '')){
                        var fotoKios = $('#foto_kios').val().split('.');
                        if(fotoKios[fotoKios.length-1] != 'jpg' && fotoKios[fotoKios.length-1] != 'jpeg' && fotoKios[fotoKios.length-1] != 'png' && fotoKios[fotoKios.length-1] != 'gif') {
                            $('#foto_kios').parent().append('<span class="text-danger">Foto kios hanya dapat mengunggah file png, jpg, jpeg, atau gif</span>');
                            error=true;
                        }

                        var files = $('#foto_kios')[0].files;
                        fd.append('foto_kios', files[0]);
                        fd.append('foto_extension', fotoKios[fotoKios.length-1]);
                    }

                    var khasPasar = $('#khas_pasar').find('.input-group .khas-pasar');
                    for (element of khasPasar) {
                        if(element.value == '') {
                            $(this).find('#khas_pasar').parent().append('<span class="text-danger">Khas pasar field is required</span>');
                            return;
                        }
                    }
                    var namaKios = $('#nama_kios');
                    if(namaKios.val().trim() == '') {
                        $('#nama_kios').parent().append('<span class="text-danger">Nama kios field is required</span>');
                        error=true;
                    }
                    var lokasiKios = $('#lokasi_kios');
                    if(lokasiKios.val().trim() == '') {
                        $('#lokasi_kios').parent().append('<span class="text-danger">Lokasi kios field is required</span>');
                        error=true;
                    }

                    if( error) return
                    else {
                        $.ajax({
                            url: apiBaseUrl+'admin/addkios',
                            type: 'POST',
                            data: fd,
                            processData: false,
                            contentType: false
                        })
                        .done(function(data) {
                            getkios();
                            $('input').val('');
                            $('#list').slideToggle(200);
                            $('#form-tambah').slideToggle(200);
                            $('#btn-tambah').toggleClass('active');
                            if(data == 'sudah ada') {
                                var tag = "<div class='alert alert-danger'>"
                                    + "<span>Kios sudah ada pada pasar!</span>"
                                    + "</div>";
                            } else {
                                var tag = "<div class='alert alert-success'>"
                                    + "<span>Berhasil menambahkan kios pada pasar!</span>"
                                    + "</div>";
                            }
                            $('#alert-spot').html(tag);
                        })
                        .fail(function(fail) {
                            console.log(fail.responseText);
                        });
                    }
                });
            } else if(window.location.href == baseUrl+'admin/utama.html') {
                getutama();

                $("#list").on('click', ".detail-pasar", function (event) {
                    event.preventDefault();
                    var element = $(this);
                    var id = element.attr('id-pasar');
                    $('#btn-tambah').slideUp(200);
                    $('#list').slideUp(200);
                    $('#form-tambah').slideUp(200);
                    $('#detail').slideDown(200);
                    $.ajax({
                        url: apiBaseUrl+'admin/getoneutama/'+id,
                        type: 'GET'
                    })
                    .done(function(data) {
                        $("#id-pasar-detail").val(data.pasar.id_pasar);
                        $("#nama_pasar_detail").val(data.pasar.nama_pasar);
                        $("#kelas_pasar_detail").val(data.pasar.kelas_pasar);
                        $("#alamat_pasar_detail").val(data.pasar.alamat_pasar);
                        $("#latitude_detail").val(data.pasar.latitude);
                        $("#longitude_detail").val(data.pasar.longitude);
                        $("#kecamatan_pasar_detail").val(data.pasar.kecamatan_pasar);
                        $("#kodepos_pasar_detail").val(data.pasar.kodepos);
                        $("#instagram_pasar_detail").val(data.pasar.instagram);
                        $("#deskripsi_pasar_detail").val(data.pasar.deskripsi_pasar);
                        $("#sejarah_pasar_detail").val(data.pasar.sejarah_pasar);
                        $("#jumlah_pedagang_detail").val(data.pasar.jumlah_pedagang);
                        $("#jumlah_lantai_detail").val(data.pasar.jumlah_lantai);
                        $("#is_aktif_detail").val(data.pasar.is_aktif);
                        $("#is_denah_detail").val(data.pasar.is_denah);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $('#detail > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    //AFL: Cek nama pasar kosong atau tidak
                    var namaPasar = $('#nama_pasar_detail').val();
                    if(namaPasar == ''){
                        $(this).find('#nama_pasar_detail').parent().append('<span class="text-danger">Nama pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek alamat kosong atau tidak
                    var alamatPasar = $('#alamat_pasar_detail').val();
                    if(alamatPasar == ''){
                        $(this).find('#alamat_pasar_detail').parent().append('<span class="text-danger">Alamat pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek longitude kosong atau tidak
                    var alamatPasar = $('#longitude_detail').val();
                    if(alamatPasar == ''){
                        $(this).find('#longitude_detail').parent().append('<span class="text-danger">Longitude pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek latitude kosong atau tidak
                    var alamatPasar = $('#latitude_detail').val();
                    if(alamatPasar == ''){
                        $(this).find('#latitude_detail').parent().append('<span class="text-danger">Latitude pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek kecamatan kosong atau tidak
                    var kecamatanPasar = $('#kecamatan_pasar_detail').val();
                    if(kecamatanPasar == ''){
                        $(this).find('#kecamatan_pasar_detail').parent().append('<span class="text-danger">Kecamatan pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek kodepos kosong atau tidak
                    var kodeposPasar = $('#kodepos_pasar_detail').val();
                    if(kodeposPasar == ''){
                        $(this).find('#kodepos_pasar_detail').parent().append('<span class="text-danger">Kodepos pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek deskripsi kosong atau tidak
                    var deskripsiPasar = $('#deskripsi_pasar_detail').val();
                    if(deskripsiPasar == ''){
                        $(this).find('#deskripsi_pasar_detail').parent().append('<span class="text-danger">Deskripsi pasar harus diisi</span>');
                         return;
                    }
                    
                    $.ajax({
                        url: apiBaseUrl+'admin/editutama',
                        type: 'POST',
                        data: $(this).serialize()
                    })
                    .done(function(data) {
                        getutama();
                        $('input').val('');
                        $('#btn-tambah').slideDown(200);
                        $('#list').slideDown(200);
                        $('#form-tambah').slideUp(200);
                        $('#detail').slideUp(200);
                        var tag = "<div class='alert alert-success'>"
                            + "<span>Berhasil mengubah pasar!</span>"
                            + "</div>";
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                    
                });

                $('#form-tambah > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    //AFL: Cek nama pasar kosong atau tidak
                    var namaPasar = $('#nama_pasar').val();
                    if(namaPasar == ''){
                        $(this).find('#nama_pasar').parent().append('<span class="text-danger">Nama pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek alamat kosong atau tidak
                    var alamatPasar = $('#alamat_pasar').val();
                    if(alamatPasar == ''){
                        $(this).find('#alamat_pasar').parent().append('<span class="text-danger">Alamat pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek longitude kosong atau tidak
                    var alamatPasar = $('#longitude').val();
                    if(alamatPasar == ''){
                        $(this).find('#longitude').parent().append('<span class="text-danger">Longitude pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek latitude kosong atau tidak
                    var alamatPasar = $('#latitude').val();
                    if(alamatPasar == ''){
                        $(this).find('#latitude').parent().append('<span class="text-danger">Latitude pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek kecamatan kosong atau tidak
                    var kecamatanPasar = $('#kecamatan_pasar').val();
                    if(kecamatanPasar == ''){
                        $(this).find('#kecamatan_pasar').parent().append('<span class="text-danger">Kecamatan pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek kodepos kosong atau tidak
                    var kodeposPasar = $('#kodepos_pasar').val();
                    if(kodeposPasar == ''){
                        $(this).find('#kodepos_pasar').parent().append('<span class="text-danger">Kodepos pasar harus diisi</span>');
                         return;
                    }

                    //AFL: Cek deskripsi kosong atau tidak
                    var deskripsiPasar = $('#deskripsi_pasar').val();
                    if(deskripsiPasar == ''){
                        $(this).find('#deskripsi_pasar').parent().append('<span class="text-danger">Deskripsi pasar harus diisi</span>');
                         return;
                    }
                    
                    $.ajax({
                        url: apiBaseUrl+'admin/addutama',
                        type: 'POST',
                        data: $(this).serialize()
                    })
                    .done(function(data) {
                        getutama();
                        $('input').val('');
                        $('#list').slideToggle(200);
                        $('#form-tambah').slideToggle(200);
                        $('#btn-tambah').toggleClass('active');
                        if(data == 'sudah ada') {
                            var tag = "<div class='alert alert-danger'>"
                                + "<span>Pasar sudah ada</span>"
                                + "</div>";
                        } else {
                            var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil menambahkan pasar baru!</span>"
                                + "</div>";
                        }
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                    
                });
            } else if(window.location.href == baseUrl+'admin/gedung.html') {
                getgedung();

                $('#nama_pasar').on('change', function name(event) {
                    event.preventDefault();
                    $('#lantai_pasar').children().remove();

                    var idnya = $(this).val();

                    pasarList.forEach(value => {
                        if(idnya == value.id_pasar) {
                            var jumlahLantai = value.jumlah_lantai;
                            for(var i=1; i<=jumlahLantai; i++) {
                                var tagslct = "<option value='"+i+"'>Lantai "+i+"</option>";
                                $('#lantai_pasar').append(tagslct);
                            }
                        }
                    });
                });

                $("#list").on('click', ".hapus-gedung", function (event) {
                    event.preventDefault();
                    var element = $(this);
                    var id = element.attr('id-gedung');
                    $.ajax({
                        url: apiBaseUrl+'admin/deletegedung/'+id,
                        type: 'GET'
                    })
                    .done(function(data) {
                        getgedung();
                        var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil menghapus gedung!</span>"
                                + "</div>";
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $('#form-tambah > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    //AFL: Cek nama gedung kosong atau tidak
                    var namaPasar = $('#nama_gedung').val();
                    if(namaPasar == ''){
                        $(this).find('#nama_gedung').parent().append('<span class="text-danger">Nama gedung harus diisi</span>');
                         return;
                    }
                    
                    $.ajax({
                        url: apiBaseUrl+'admin/addgedung',
                        type: 'POST',
                        data: $(this).serialize()
                    })
                    .done(function(data) {
                        getgedung();
                        $('input').val('');
                        $('#list').slideToggle(200);
                        $('#form-tambah').slideToggle(200);
                        $('#btn-tambah').toggleClass('active');
                        if(data == 'sudah ada') {
                            var tag = "<div class='alert alert-danger'>"
                                + "<span>Gedung sudah ada</span>"
                                + "</div>";
                        } else {
                            var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil menambahkan gedung baru!</span>"
                                + "</div>";
                        }
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                    
                });
            } else if(window.location.href == baseUrl+'admin/foto.html') {
                getfoto();

                $("#list").on('click', ".tambah-foto", function (event) {
                    event.preventDefault();
                    var element = $(this);
                    var id = element.attr('id-pasar');
                    $('#btn-tambah').slideUp(200);
                    $('#list').slideUp(200);
                    $('#form-tambah').slideUp(200);
                    $('#detail').slideDown(200);
                    $.ajax({
                        url: apiBaseUrl+'admin/getonefoto/'+id,
                        type: 'GET'
                    })
                    .done(function(data) {
                        $("#id-pasar").val(data.pasar.id_pasar);
                        $("#nama_pasar").val(data.pasar.nama_pasar);

                        $('#carousel-foto').children().remove();
                        $('#carousel-foto').append('<div class="owl-carousel"></div>');
                        data.foto.forEach(element => {    
                            var tag = "<div class='hapus-foto' id-foto='"+element.id_pasar_foto+"'><img style='height:250px; object-fit:cover;' src='"+apiBaseUrl+"fotopasar/"+element.nama_file+"' alt='"+element.caption+"'></div>";
                            $(".owl-carousel").append(tag);
                        });

                        $(".owl-carousel").owlCarousel({
                            stagePadding: 50,
                            margin: 20,
                            /*
                            loop:($(".owl-carousel .item").length > 2) ? true: false,
                            center: ($(".owl-carousel .item").length > 2) ? true: false,
                            */
                            loop: false,
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
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });

                $('#detail').on('click', '.hapus-foto', function (event) {
                    event.preventDefault();

                    var id = $(this).attr('id-foto');

                    if(confirm('Apakah anda yakin ingin menghapus foto tersebut?')) {
                        $.ajax({
                            url: apiBaseUrl+'admin/deletefoto/'+id,
                            type: 'GET'
                        })
                        .done(function(data) {
                            getfoto();
                            $('input').val('');
                            $('#btn-tambah').slideDown(200);
                            $('#list').slideDown(200);
                            $('#form-tambah').slideUp(200);
                            $('#detail').slideUp(200);
                            var tag = "<div class='alert alert-success'>"
                                + "<span>Berhasil menghapus foto pada pasar!</span>"
                                + "</div>";
                            $('#alert-spot').html(tag);
                        })
                        .fail(function(fail) {
                            console.log(fail.responseText);
                        });
                    }
                })

                $('#detail > form').on('submit', function (event) {
                    event.preventDefault();

                    $(this).find('span').remove();

                    var fotoKios = $('#foto_pasar').val().split('.');
                    if(fotoKios[fotoKios.length-1] != 'jpg' && fotoKios[fotoKios.length-1] != 'jpeg' && fotoKios[fotoKios.length-1] != 'png' && fotoKios[fotoKios.length-1] != 'gif') {
                        $('#foto_pasar').parent().append('<span class="text-danger">Foto pasar field can only upload png, jpg, jpeg, or gif file</span>');
                    }

                    var fd = new FormData(this);
                    var files = $('#foto_pasar')[0].files;
                    fd.append('foto_pasar', files[0]);
                    fd.append('foto_extension', fotoKios[fotoKios.length-1]);

                    $.ajax({
                        url: apiBaseUrl+'admin/addfoto',
                        type: 'POST',
                        data: fd,
                        processData: false,
                        contentType: false
                    })
                    .done(function(data) {
                        getfoto();
                        $('input').val('');
                        $('#btn-tambah').slideDown(200);
                        $('#list').slideDown(200);
                        $('#form-tambah').slideUp(200);
                        $('#detail').slideUp(200);
                        var tag = "<div class='alert alert-success'>"
                            + "<span>Berhasil menambah foto pada pasar!</span>"
                            + "</div>";
                        $('#alert-spot').html(tag);
                    })
                    .fail(function(fail) {
                        console.log(fail.responseText);
                    });
                });
            }
        }
    })
})