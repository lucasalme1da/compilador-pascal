/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_SINTATICO_TAB_H_INCLUDED
# define YY_YY_SINTATICO_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    S_SUBT = 258,
    S_SOMA = 259,
    S_MULT = 260,
    S_DIVI_REAL = 261,
    S_DIVI_INT = 262,
    S_RESTO_DIVI = 263,
    S_MAIOR_QUE = 264,
    S_MENOR_QUE = 265,
    S_MAIOR_IGUAL_QUE = 266,
    S_MENOR_IGUAL_QUE = 267,
    S_IGUAL = 268,
    S_DIFERENTE = 269,
    S_VERDADEIRO = 270,
    S_FALSO = 271,
    S_OR = 272,
    S_AND = 273,
    S_NOT = 274,
    S_PAR_ABRE = 275,
    S_PAR_FECHA = 276,
    S_VAR = 277,
    S_PROGRAM = 278,
    S_IF = 279,
    S_THEN = 280,
    S_ELSE = 281,
    S_PONTO = 282,
    S_VIRGULA = 283,
    S_PONTOVG = 284,
    S_BEGIN = 285,
    S_END = 286,
    S_ATRIB = 287,
    S_MAIS = 288,
    S_VEZES = 289,
    S_DOISPONTOS = 290,
    S_IDENTIFICADOR = 291,
    S_INTEIRO = 292
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SINTATICO_TAB_H_INCLUDED  */
