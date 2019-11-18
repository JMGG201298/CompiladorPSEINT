package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
espacio=[ ,\t,\r,\n]+
L=[a-zA-Z_]+
D=[0-9]+
para=[Pp]{1}[Aa]{1}[Rr]{1}[Aa]{1}
comentarios="//".*
numeroEntero=0|[1-9][0-9]+
numeroFlotante=[0-9][0-9]*[.][0-9]+
operadoresRelacion=[=><]{1}|>=|<=
asignacion="<-"
operadoresLogicos=[YO]{1}
finInstrucción=[;]{1}
dosPuntos=[:]{1}
funcion=[Ff]{1}[Uu]{1}[Nn]{1}[Cc]{1}[Ii]{1}[Oo]{1}[Nn]{1}
algoritmo=[aA]{1}[Ll]{1}[Gg]{1}[oO]{1}[rR]{1}[iI]{1}[Tt]{1}[Mm]{1}[oO]{1}
escribir=[Ee]{1}[Ss]{1}[Cc]{1}[Rr]{1}[iI]{1}[Bb]{1}[Ii]{1}[Rr]{1}
leer=[Ll]{1}[Ee]{2}[Rr]{1}
si=[Ss]{1}[Ii]{1}
no=[Nn]{1}[oO]{1}
siNo=[Ss]{1}[iI]{1}[Nn]{1}[oO]{1}
finAlgotirmo=[fF]{1}[iI]{1}[Nn]{1}[aA]{1}[Ll]{1}[Gg]{1}[oO]{1}[Rr]{1}[Ii]{1}[tT]{1}[mM]{1}[oO]{1}
entonces=[Ee]{1}[Nn]{1}[Tt]{1}[Oo]{1}[Nn]{1}[Cc]{1}[Ee]{1}[Ss]{1}
segun=[Ss]{1}[Ee]{1}[Gg]{1}[Uu]{1}[Nn]{1}
hacer=[Hh]{1}[Aa]{1}[Cc]{1}[Ee]{1}[Rr]{1}
deOtroModo=[Dd]{1}[Ee]{1}[Oo]{1}[Tt]{1}[Rr]{1}[oO]{1}[Mm]{1}[oO]{1}[Dd]{1}[Oo]{1}
mientras=[Mm]{1}[Ii]{1}[Ee]{1}[Nn]{1}[Tt]{1}[Rr]{1}[Aa]{1}[sS]{1}
repetir=[Rr]{1}[Ee]{1}[Pp]{1}[Ee]{1}[Tt]{1}[iI]{1}[Rr]{1}
hastaQue=[Hh]{1}[Aa]{1}[Ss]{1}[tT]{1}[aA]{1}[Qq]{1}[uU]{1}[eE]{1}
que=[Qq]{1}[Uu]{1}[eE]{1}
para=[Pp]{1}[Aa]{1}[Rr]{1}[Aa]{1}
conPaso=[Cc]{1}[oO]{1}[nN]{1}[Pp]{1}[Aa]{1}[Ss]{1}[Oo]{1}
valorLogico=([Vv]{1}[Ee]{1}[Rr]{1}[Dd]{1}[Aa]{1}[Dd]{1}[Ee]{1}[Rr]{1}[Oo]{1})|[Ff]{1}[Aa]{1}[Ll]{1}[Ss]{1}[Oo]{1}
cadena=['](.)*[']
pAbierto=[(]
pCerrado=[)]
finSi=[fF]{1}[Ii]{1}[nN]{1}[Ss]{1}[Ii]{1}
finSegun=[fF]{1}[Ii]{1}[nN]{1}[Ss]{1}[Ee]{1}[gG]{1}[uU]{1}[nN]{1}
finMientras=[fF]{1}[Ii]{1}[nN]{1}[Mm]{1}[Ii]{1}[Ee]{1}[Nn]{1}[Tt]{1}[rR]{1}[aA]{1}[sS]{1}
finPara=[fF]{1}[Ii]{1}[nN]{1}[Pp]{1}[Aa]{1}[Rr]{1}[Aa]{1}
finFuncion=[fF]{1}[Ii]{1}[nN]{1}[Ff]{1}[Uu]{1}[Nn]{1}[Cc]{1}[Ii]{1}[Oo]{1}[Nn]{1}
//identificador=[_|a-z|A-Z][a-z|A-Z|0-9|_]+
operadoresAlgrebraicos=[+-/\*%]{1}
error=. 
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }

%}
%%
{espacio} {/*Ignore*/}

{para} {return new Symbol(sym.PRPA, yychar, yyline, yytext());}
{comentarios} {return new Symbol(sym.CS, yychar, yyline, yytext());}
{operadoresRelacion} {return new Symbol(sym.OR, yychar, yyline, yytext());}
{asignacion} {return new Symbol(sym.PRAN, yychar, yyline, yytext());}
{finInstrucción} {return new Symbol(sym.PYC, yychar, yyline, yytext());}
{dosPuntos} {return new Symbol(sym.DP, yychar, yyline, yytext());}
{funcion} {return new Symbol(sym.PRFUN, yychar, yyline, yytext());}
{algoritmo} {return new Symbol(sym.PRAO, yychar, yyline, yytext());}
{escribir} {return new Symbol(sym.PRER, yychar, yyline, yytext());}
{leer} {return new Symbol(sym.PRLR, yychar, yyline, yytext());}
{si} {return new Symbol(sym.PRSI, yychar, yyline, yytext());}
{no} {return new Symbol(sym.PRNO, yychar, yyline, yytext());}
{entonces} {return new Symbol(sym.PRES, yychar, yyline, yytext());}
{segun} {return new Symbol(sym.PRSN, yychar, yyline, yytext());}
{hacer} {return new Symbol(sym.PRHR, yychar, yyline, yytext());}
{deOtroModo} {return new Symbol(sym.PRDO, yychar, yyline, yytext());}
{repetir} {return new Symbol(sym.PRRR, yychar, yyline, yytext());}
{que} {return new Symbol(sym.PRQE, yychar, yyline, yytext());}
{valorLogico} {return new Symbol(sym.VL, yychar, yyline, yytext());}
{cadena} {return new Symbol(sym.STR, yychar, yyline, yytext());}
{finSi} {return new Symbol(sym.FI, yychar, yyline, yytext());}
{finSegun} {return new Symbol(sym.FSN, yychar, yyline, yytext());}
{finMientras} {return new Symbol(sym.FMS, yychar, yyline, yytext());}
{finPara} {return new Symbol(sym.FPA, yychar, yyline, yytext());}
{finFuncion} {return new Symbol(sym.FFN, yychar, yyline, yytext());}
{hastaQue} {return new Symbol(sym.PRHE, yychar, yyline, yytext());}
{siNo} {return new Symbol(sym.PRSO, yychar, yyline, yytext());}
{pAbierto} {return new Symbol(sym.PA, yychar, yyline, yytext());}
{pCerrado} {return new Symbol(sym.PCD, yychar, yyline, yytext());}
{dosPuntos} {return new Symbol(sym.PC, yychar, yyline, yytext());}
{finInstrucción} {return new Symbol(sym.FITN, yychar, yyline, yytext());}
{conPaso} {return new Symbol(sym.CPSO, yychar, yyline, yytext());}
{finAlgotirmo} {return new Symbol(sym.PRFO, yychar, yyline, yytext());}
{operadoresLogicos} {return new Symbol(sym.OL, yychar, yyline, yytext());}
{mientras} {return new Symbol(sym.PRMS, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.ID, yychar, yyline, yytext());}
{numeroFlotante} {return new Symbol(sym.NF, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.NE, yychar, yyline, yytext());}
{operadoresAlgrebraicos} {return new Symbol(sym.OAS, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
