% --- PERSONAJES (nombre, nivel, vida) ---
personaje('Elara', 5, 100).
personaje('Kael', 3, 80). 
personaje('Rin', 7, 120).
personaje('Nicolas', 4, 90).

% --- MISIONES (id, nombre, dificultad, XP) --- 
mision(m1, 'Bosque de Sombras', 2, 50). 
mision(m2, 'Cueva del Dragón', 5, 120). 
mision(m3, 'Torre Arcana', 7, 200).

% --- INVENTARIOS (personaje, lista de objetos) ---
inventario('Elara', [espada, escudo, pocion]).
inventario('Kael', [arco, flechas]).
inventario('Rin', [varita, grimorio, pocion, amuletol]).
inventario('Nicolas', [daga, pocion, 'Daga Venenosa']).

% --- OBJETOS REQUERIDOS POR MISIÓN ---
requiere(m2, escudo). 
requiere(m2, pocion). 
requiere(m3, grimorio). 
requiere(m3, pocion).

% --- ESTRUCTURA DE ARMAS ---
arma('Daga Venenosa', 45, veneno).

% --- ARMAS Y EQUIPAMIENTO ---
tiene('Nicolas', arma('Daga Venenosa', 45, veneno)).

% Jueves 10 de Septiembre del 2026

xp_para_subir(NivelActual, XP) :-
    XP is NivelActual * 30.

vida_restante(VidaMax, Danio, Final) :-
    Final is VidaMax - Danio.

% Factorial: el recursivo de referencia
factorial(0, 1).
factorial(N, R) :-
    N1 is N - 1,
    factorial(N1, R1),
    R is N * R1.

% XP acumulada tras N misiones
xp_acumulada(0, 0).
% Caso recursivo: XP(N) = XP(N - 1) + (30 + N)
xp_acumulada(N, Total) :-
    N > 0,
    N1 is N - 1,
    xp_acumulada(N1, Prev),
    Total is Prev + (30 * N).

% Funcion danio acumulado tras N golpes
dano_acumulado(0,0).
dano_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    dano_acumulado(N1, Prev),
    Total is Prev + (10 * N).

%  Detectar coincidencias y validar datos
mismo_nivel(P1, P2) :-
    personaje(P1, N, _),
    personaje(P2, N, _),
    P1 \== P2.

es_balanceado(P) :-
    personaje(P, _, Vida),
    Vida =:= 100.

% Compara niveles entre dos personajes
mas_fuerte(P1, P2) :-
    personaje(P1, Nivel1, _),
    personaje(P2, Nivel2, _),
    Nivel1 > Nivel2.

% Comprueba si dos personajes comparten un objeto de su inventario
mismo_objeto(P1, P2, Obj) :-
    inventario(P1, Lista1),
    inventario(P2, Lista2),
    member(Obj, Lista1),
    member(Obj, Lista2),
    