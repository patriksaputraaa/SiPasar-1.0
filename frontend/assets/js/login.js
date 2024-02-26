$(function () {
    const apiBaseUrl = "http://localhost:8000/";

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

    $('#login-form').on('submit', function (event) {
        event.preventDefault();
        var thiss = $(this);
        thiss.find('span').remove();
        $('#login-form button[type=submit]').html('<span class="fas fa-circle-notch fa-spin"></span>');
        $('#login-form button[type=submit]').addClass('disabled');
        $.ajax({
            url: apiBaseUrl+'login',
            type: 'POST',
            data: thiss.serialize()
        })
        .done(function(data) {
            if(data.error_message != undefined) {
                var tag = "<div class='alert alert-danger'>"
                + "<span>" + data.error_message + "</span>"
                + "</div>";
                $('.alert-spot').html(tag);
            }
            if(data.success_message != undefined) {
                makeCookies({token: data.success_message.token, nama: data.success_message.nama});
                window.location.replace("admin/");
            }
            $('#login-form button[type=submit]').html('Login');
            $('#login-form button[type=submit]').removeClass('disabled');
        })
        .fail(function(fail) {
            console.log(fail.responseText);
            var message = JSON.parse(fail.responseText);
            console.log(message);
            if (message.username != undefined && message.username.length >= 1) {
                for (let value of message.username) {
                    thiss.find('#username').parent().append('<span class="text-danger">'+value+'</span>');
                }
            }
            if (message.password != undefined && message.password.length >= 1) {
                for (let value of message.password) {
                    thiss.find('#password').parent().append('<span class="text-danger">'+value+'</span>');
                }
            }
            $('#login-form button[type=submit]').html('Login');
            $('#login-form button[type=submit]').removeClass('disabled');
        });
    })

    $(document).ready(function () {
        var token = getCookies("token");
        if(token != undefined) {
            window.location.replace("admin/");
        }
    })
})