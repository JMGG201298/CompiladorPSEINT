package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
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
    public String lexeme;
%}
%%
{espacio} {/*Ignore*/}
{para} {lexeme=yytext(); return PRPA;}
{comentarios} {lexeme=yytext(); return CS;}
{operadoresRelacion} {lexeme=yytext(); return OR;}
{asignacion} {lexeme=yytext(); return PRAN;}
{finInstrucción} {lexeme=yytext(); return PYC;}
{dosPuntos} {lexeme=yytext(); return DP;}
{funcion} {lexeme=yytext(); return PRFUN;}
{algoritmo} {lexeme=yytext(); return PRAO;}
{escribir} {lexeme=yytext(); return PRER;}
{leer} {lexeme=yytext(); return PRLR;}
{si} {lexeme=yytext(); return PRSI;}
{no} {lexeme=yytext(); return PRNO;}
{entonces} {lexeme=yytext(); return PRES;}
{segun} {lexeme=yytext(); return PRSN;}
{hacer} {lexeme=yytext(); return PRHR;}
{deOtroModo} {lexeme=yytext(); return PRDO;}
{repetir} {lexeme=yytext(); return PRRR;}
{que} {lexeme=yytext(); return PRQE;}
{valorLogico} {lexeme=yytext(); return VL;}
{cadena} {lexeme=yytext(); return STR;}
{finSi} {lexeme=yytext(); return FI;}
{finSegun} {lexeme=yytext(); return FSN;}
{finMientras} {lexeme=yytext(); return FMS;}
{finPara} {lexeme=yytext(); return FPA;}
{finFuncion} {lexeme=yytext(); return FFN;}
{hastaQue} {lexeme=yytext(); return PRHE;}
{siNo} {lexeme=yytext(); return PRSO;}
{pAbierto} {lexeme=yytext(); return PA;}
{pCerrado} {lexeme=yytext(); return PCD;}
{dosPuntos} {lexeme=yytext(); return PC;}
{finInstrucción} {lexeme=yytext(); return FITN;}
{conPaso} {lexeme=yytext(); return ID;}
{finAlgotirmo} {lexeme=yytext(); return PRFO;}
{operadoresLogicos} {lexeme=yytext(); return OL;}
{mientras} {lexeme=yytext(); return PRMS;}
{L}({L}|{D})* {lexeme=yytext(); return ID;}
{numeroFlotante} {lexeme=yytext(); return NF;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return NE;}
{operadoresAlgrebraicos} {lexeme=yytext(); return OAS;}
 . {lexeme=yytext(); return ERROR;}