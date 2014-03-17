/* ----------------------------
APP
Amb la casa sí que s'hi juga 
------------------------------ */

$(document).ready(function() {   
    
    var fase = 0;
    var monedes = 100;
    var preu;
    var estalvi;
    var energia = 89;
    var valor_items = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    $(".items").click(function(){
        $("#advertiser").hide();
        var id_item = $(this).attr('value');
        if (valor_items[id_item] == 0) {
            valor_items[id_item] = 1;
            obtenir_text(id_item);
            indicadors(id_item);
        }
        
    });
    
    //Amagem elements de la casa
    $("#casa_tendal").hide();
    $("#casa_aillament").hide();
    $("#casa_tele").hide();
    $("#casa_pintura").hide();
    $("#casa_finestres").hide();
    $("#casa_jacuzzi").hide();
    //$("#casa_lampades").hide();
    $("#casa_plantes").hide();
    $("#casa_caldera").hide();
    //$("#casa_electrodomestics").hide();
    $("#casa_captadors_termics").hide();
    $("#casa_captadors_fotovoltaics").hide();
    
    $("#punt_tendal").hide();
    $("#punt_aillament").hide();
    $("#punt_tele").hide();
    $("#punt_pintura").hide();
    $("#punt_finestres").hide();
    $("#punt_jacuzzi").hide();
    $("#punt_llums").hide();
    $("#punt_plantes").hide();
    $("#punt_caldera").hide();
    $("#punt_electrodomestics").hide();
    $("#punt_captadors_termics").hide();
    $("#punt_captadors_fotovoltaics").hide();
    
    $("#text_tendal").hide();
    $("#text_aillament").hide();
    $("#text_tele").hide();
    $("#text_pintura").hide();
    $("#text_finestres").hide();
    $("#text_jacuzzi").hide();
    $("#text_llums").hide();
    $("#text_plantes").hide();
    $("#text_caldera").hide();
    $("#text_electrodomestics").hide();
    $("#text_captadors_termics").hide();
    $("#text_captadors_fotovoltaics").hide();

    $("#tendal").click(function(){
        $(this).html('<img src="img/tendal_off.jpg" alt="tendal" width="110" height="76">');
        $("#casa_tendal").show();
        $("#punt_tendal").show();
        $("#punt_tendal").mouseover(function() {
            $("#text_tendal").show();
        });
        $("#punt_tendal").mouseout(function() {
            $("#text_tendal").hide();
        });
    });
    $("#aillant").click(function(){
        $(this).html('<img src="img/aillant_off.jpg" alt="aïllant tèrmic" width="110" height="76">');
        $("#casa_aillament").show();
        $("#punt_aillament").show();
        $("#punt_aillament").mouseover(function() {
            $("#text_aillament").show();
        });
        $("#punt_aillament").mouseout(function() {
            $("#text_aillament").hide();
        });
    });
    $("#televisor").click(function(){
        $(this).html('<img src="img/televisor_off.jpg" alt="televisor" width="110" height="76">');
        $("#casa_tele").show();
        $("#punt_tele").show();
        $("#punt_tele").mouseover(function() {
            $("#text_tele").show();
        });
        $("#punt_tele").mouseout(function() {
            $("#text_tele").hide();
        });
    });
    $("#pintura").click(function(){
        $(this).html('<img src="img/pintura_off.jpg" alt="pintura" width="110" height="76">');
        $("#casa_pintura").show();
        $("#punt_pintura").show();
        $("#punt_pintura").mouseover(function() {
            $("#text_pintura").show();
        });
        $("#punt_pintura").mouseout(function() {
            $("#text_pintura").hide();
        });
    });
    $("#finestres").click(function(){
        $(this).html('<img src="img/finestra_off.jpg" alt="finestra" width="110" height="76">');
        $("#casa_finestres").show();
        $("#punt_finestres").show();
        $("#punt_finestres").mouseover(function() {
            $("#text_finestres").show();
        });
        $("#punt_finestres").mouseout(function() {
            $("#text_finestres").hide();
        });
    });
    $("#jacuzzi").click(function(){
        $(this).html('<img src="img/jacuzzi_off.jpg" alt="jacuzzi" width="110" height="76">');
        $("#casa_jacuzzi").show();
        $("#punt_jacuzzi").show();
        $("#punt_jacuzzi").mouseover(function() {
            $("#text_jacuzzi").show();
        });
        $("#punt_jacuzzi").mouseout(function() {
            $("#text_jacuzzi").hide();
        });
    });
    $("#lampades").click(function(){
        $(this).html('<img src="img/llums_off.jpg" alt="lampades" width="110" height="76">');
        $("#casa_llums").show();
        $("#punt_llums").show();
        $("#punt_llums").mouseover(function() {
            $("#text_llums").show();
        });
        $("#punt_llums").mouseout(function() {
            $("#text_llums").hide();
        });
    });
    $("#plantes").click(function(){
        $(this).html('<img src="img/plantes_off.jpg" alt="plantes" width="110" height="76">');
        $("#casa_plantes").show();
        $("#punt_plantes").show();
        $("#punt_plantes").mouseover(function() {
            $("#text_plantes").show();
        });
        $("#punt_plantes").mouseout(function() {
            $("#text_plantes").hide();
        });
    });
    $("#caldera").click(function(){
        $(this).html('<img src="img/caldera_off.jpg" alt="caldera" width="110" height="76">');
        $("#casa_caldera").show();
        $("#punt_caldera").show();
        $("#punt_caldera").mouseover(function() {
            $("#text_caldera").show();
        });
        $("#punt_caldera").mouseout(function() {
            $("#text_caldera").hide();
        });
    });
    $("#electrodomestics").click(function(){
        $(this).html('<img src="img/electrodomestics_off.jpg" alt="electrodomestics" width="110" height="76">');
        $("#casa_electrodomestics").show();
        $("#punt_electrodomestics").show();
        $("#punt_electrodomestics").mouseover(function() {
            $("#text_electrodomestics").show();
        });
        $("#punt_electrodomestics").mouseout(function() {
            $("#text_electrodomestics").hide();
        });
    });
    $("#captadors_termics").click(function(){
        $(this).html('<img src="img/captadors_termics_off.jpg" alt="captadors tèrmics" width="110" height="76">');
        $("#casa_captadors_termics").show();
        $("#punt_captadors_termics").show();
        $("#punt_captadors_termics").mouseover(function() {
            $("#text_captadors_termics").show();
        });
        $("#punt_captadors_termics").mouseout(function() {
            $("#text_captadors_termics").hide();
        });
    });
    $("#captadors_fotovoltaics").click(function(){
        $(this).html('<img src="img/captadors_fotovoltaics_off.jpg" alt="captadors fotovoltaics" width="110" height="76">');
        $("#casa_captadors_fotovoltaics").show();
        $("#punt_captadors_fotovoltaics").show();
        $("#punt_captadors_fotovoltaics").mouseover(function() {
            $("#text_captadors_fotovoltaics").show();
        });
        $("#punt_captadors_fotovoltaics").mouseout(function() {
            $("#text_captadors_fotovoltaics").hide();
        });
    });

    
    function obtenir_text(id_item) {
        $.getJSON( "data/respostes.json", function( data ) {
            var resposta = data.elements[fase].respostes[id_item].text_resposta;
            escriu_resposta(resposta);
            canvi_fase();  
        });
    }
    
    function escriu_resposta(resposta) {
        var hora = jQuery.now();
        var time = new Date(hora);
        h = time.getHours();
        m = time.getMinutes();
        if (m < 10) {
            m = '0'+m;
        }
        //Aquí posem un "pedaç" per fer que sempre quedi un marge en l'últim element. Ha de funcionar en IE6, per tant res de last selector
        $(".last-margin").hide();
        
        $("#left-panel").append('<div class="chat"><div class="time">'+h+':'+m+'</div>'+resposta+'</div><div class="last-margin"></div>');   
        
    }

    function indicadors(id_item) {
        
        switch(id_item) {
            case '0':
                preu = 40;
                estalvi = 30;
            break;
            case '1':
                preu = 20;
                estalvi = 15;
            break;
            case '2':
                preu = 6;
                estalvi = 4;
            break;
            case '3':
                preu = 12;
                estalvi = 10;
            break;
            case '4':
                preu = 6;
                estalvi = 4;
            break;
            case '5':
                preu = 10;
                estalvi = -1;
            break;
            case '6':
                preu = 15;
                estalvi = 12;
            break;
            case '7':
                preu = 10;
                estalvi = 0;
            break;
            case '8':
                preu = 35;
                estalvi = -10;
            break;
            case '9':
                preu = 5;
                estalvi = 0;
            break;
            case '10':
                preu = 20;
                estalvi = 14;
            break;
            case '11':
                preu = 20;
                estalvi = 12;
            break;
        }
        
        monedes = monedes-preu;
        energia = energia-estalvi;

        $("#money").text(monedes);
        $("#energy-fill").css("width", energia+"%");
        if (monedes <= 0) {
            if (monedes < 0) {
                $("#money").css( "color", "#f15c4c" );
            }
            game_over(monedes);
        }
    
    }

    function canvi_fase() {
        fase++;
        if (fase == 1 && valor_items[1] == 0) {
            setTimeout(function(){
                var text_fase1 = 'Si l\'aire calent s\'escapa cap a fora hem de fer servir més la calefacció. Se t\'acudeix alguna solució?<img class="chat-image" src="img/chat_aire_escapa.jpg" alt="Aire escapa">';
                escriu_resposta(text_fase1);
                $("#left-panel").scrollTop($("#left-panel").height());
            }, 3000);
        }
        if (fase == 1 && valor_items[1] != 0) {
            fase++;
        }
        if (fase == 2 && valor_items[2] == 0) {
            setTimeout(function(){
                var text_fase2 = 'A l\'estiu entren els rajos del sol i la casa s\'escalfa tant que sembla un forn. Hem de fer alguna cosa per evitar-ho!<img class="chat-image" src="img/chat_rajos_sol.jpg" alt="Radiació solar">';
                escriu_resposta(text_fase2);
                $("#left-panel").scrollTop($("#left-panel").height()); 
            }, 3000);
        }
        if (fase == 2 && valor_items[2] != 0) {
            fase++;
        }
        if (fase == 3) {
            setTimeout(function(){
                var text_fase3 = 'Se t\'acudeix alguna manera de gastar menys gas natural? Les factures són tan elevades que posen els pèls de punta!<img class="chat-image" src="img/chat_cremador.jpg" alt="Despesa de gas natural">';
                escriu_resposta(text_fase3);
                $("#left-panel").scrollTop($("#left-panel").height());
            }, 3000);
        }
        if (fase == 4) {
            setTimeout(function(){
                var text_fase4 = 'Estaria bé trobar la manera de gastar menys electricitat. Com ho podríem fer?<img class="chat-image" src="img/chat_electricitat.jpg" alt="Despesa elèctrica">';
                escriu_resposta(text_fase4);
                $("#left-panel").scrollTop($("#left-panel").height());
            }, 3000);
        }
        if (fase > 4) {
            setTimeout(function(){
                var text_fase5 = 'Pots seguir fent canvis a la casa mentre tinguis diners. Recorda que l\'objectiu és estalviar energia!';
                escriu_resposta(text_fase5);
                $("#left-panel").scrollTop($("#left-panel").height());
            }, 3000);
        }
        $("#left-panel").scrollTop($("#left-panel").height());

    }

    function game_over(monedes) {
        var energia_inicial = 89;
        var energia_final = energia;
        var total_estalvi = 100 - ((energia_final/energia_inicial)*100);
        var estalvi_formatejat = total_estalvi.toFixed(0);
        var diners_restants = monedes*(-1);
        var missatge_deute = "Amb els diners que estalviaràs a les factures d\'electricitat i gas podràs pagar el deute sense problemes."; 
        
        if (diners_restants == 0) {
            missatge_deute = " ";   
        }
        
        if (total_estalvi < 50) {
            if (monedes == 0) {
                $("#items-container").html('<div class="final_explica_decepcionat container_final"><p>Ja no et queden monedes.</p><p>Has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Hauries pogut utilitzar millor els diners per estalviar energia...</p></div>');
            }
            else {
                $("#items-container").html('<div class="final_explica_decepcionat container_final"><p>Ja no et queden monedes.</p><p>Has acabat amb un deute de '+diners_restants+' monedes i has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Hauries pogut utilitzar millor els diners per estalviar energia...</p></div>');
            }
        }
        else if (total_estalvi >= 50 && total_estalvi < 75) {
            if (monedes == 0) {
                $("#items-container").html('<div class="final_explica container_final"><p>Ja no et queden monedes.</p><p>Has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Has aconseguit estalviar molta energia, però encara hi havia marge per estalviar més!</p></div>');
            }
            else {
                $("#items-container").html('<div class="final_explica container_final"><p>Ja no et queden monedes.</p><p>Has acabat amb un deute de '+diners_restants+' monedes i has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Has aconseguit estalviar molta energia, però encara hi havia marge per estalviar més!</p></div>');
            }
        }
        else if (total_estalvi >= 75 && total_estalvi < 100) {
            if (monedes == 0) {
                $("#items-container").html('<div class="final_content container_final"><p>Ja no et queden monedes.</p><p>Has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Ho has fet molt bé! La casa consumeix menys d\'una quarta part del que consumia inicialment! '+missatge_deute+'</p></div>');
            }
            else {
                $("#items-container").html('<div class="final_content container_final"><p>Ja no et queden monedes.</p><p>Has acabat amb un deute de '+diners_restants+' monedes i has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Ho has fet molt bé! La casa consumeix menys d\'una quarta part del que consumia inicialment! '+missatge_deute+'</p></div>');
            }
        }
        else if (total_estalvi >= 100) {
            if (monedes == 0) {
                $("#items-container").html('<div class="final_content_2 container_final"><p>Ja no et queden monedes.</p><p>Has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Ho has fet molt bé! La casa genera més energia de la que consumeix!  '+missatge_deute+'</p></div>');
            }
            else {
                $("#items-container").html('<div class="final_content_2 container_final"><p>Ja no et queden monedes.</p><p>Has acabat amb un deute de '+diners_restants+' monedes i has aconseguit estalviar un '+estalvi_formatejat+'% d\'energia.</p><p>Ho has fet molt bé! La casa genera més energia de la que consumeix!  '+missatge_deute+'</p></div>');
            }
        }
        
        
    }

    //Aquí escrivim els textos introductoris
    setTimeout(function(){
        var text_intro1 = 'Aquesta casa consumeix massa energia!<img src="img/toni_inici.jpg" alt="Toni">';
        escriu_resposta(text_intro1);
    }, 100);
    setTimeout(function(){
        var text_intro2 = 'L\'hem de rehabilitar per aconseguir estalviar energia i fer-la més confortable.';
        escriu_resposta(text_intro2);
    }, 2000);
    setTimeout(function(){
        var text_intro3 = 'Veig que es perd calor per les façanes, la coberta i el terra. Com ho podríem evitar?<img class="chat-image" src="img/chat_perdua_calor.jpg" alt="Pèrdua de calor">';
        escriu_resposta(text_intro3);
    }, 4000);
    setTimeout(function(){
        function down() {
            $("#advertiser").animate({ "top": "+=10px" }, "slow" );
            up();
        }
        function up() {
            $("#advertiser").animate({ "top": "-=10px" }, "slow" );
            down();
        }
        $("#advertiser").show();
        down();
    }, 5000);

});
