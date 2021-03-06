(* Modula-2 Multipass-Compiler               UNIX/MC68020 *)
(* (c) Universitaet Ulm, Sektion Informatik,   D-7900 Ulm *)
IMPLEMENTATION MODULE MCP4Init;         (* AFB 8/83 *)

   FROM MCP4CodeSys IMPORT EmitLabel, EmitBSS, EmitImpure, EmitPure, EmitEntry,
      EmitExtern, EmitDCF, EmitEQU, EmitFileName, EmitVarEntry, star;
   FROM MCP4Global IMPORT Assert;
   FROM MCBase IMPORT Idptr, Stptr, mainmodp, root, globvarnext, Varkind,
      Idclass, procnumber, Stringptr, stringroot, oneword, modnamlength;
   FROM Conversions IMPORT ConvertInteger;
   FROM MCP4Public IMPORT sourcefilename;
   FROM MCP4RTS IMPORT procprefix, global, flag;
   FROM Strings IMPORT StrCat, StrCpy;
   FROM SYSTEM IMPORT ADR;


   (*
	text 0
	file	"x.m2"
	global	_x
	set	_x,~
	lcomm	G_AREA,0
	lcomm	_FLAG,1       (* bug fix of as: G_AREA must be first lcomm *)
	set	_x_V0,G_AREA
	even
   *)

   TYPE 
      Label = ARRAY [ 0..7 ] OF CHAR;

   VAR 
      GlobalLab  : Label;
      Flag       : Label;
      datasize   : CARDINAL;

   PROCEDURE PutModuleHeader(modP: Idptr);
      VAR
	 modname: ARRAY [0..modnamlength] OF CHAR;
   BEGIN 
      EmitPure;
      StrCpy(modname, "_"); StrCat(modname, modP^.identifier);
      EmitEntry(modname);
      EmitEQU(modname, star);
   END PutModuleHeader;

   PROCEDURE PutGlobal(datasize: CARDINAL); (* in Fullwords *)
   BEGIN 
      EmitBSS(ADR(GlobalLab), datasize DIV oneword); (* bug fix of as: must be first *)
      EmitBSS(ADR(Flag), 1);
   END PutGlobal;

   PROCEDURE PutImports;
      VAR 
         lp: Idptr;
   BEGIN 
      (* (* not necessary *)
      lp := root^.locp^.link;
      WHILE lp <> NIL DO 
	 EmitExtern(lp^.identifier);
         lp := lp^.link;
      END;
      *)
   END PutImports;

   PROCEDURE CalcDatasize; (* determines Size for globalMod Variables *)
      VAR 
         lp: Idptr;
   BEGIN 
      datasize := 0;
      lp := mainmodp^.globvarp;
      WHILE lp<>NIL DO 
         WITH lp^ DO 
            Assert((klass = vars) AND (vkind = noparam));
            IF indaccess THEN 
               INC(datasize, idtyp^.size);
               (* align datasize *)
               IF datasize MOD oneword <> 0 THEN
                  INC(datasize, oneword - datasize MOD oneword);
               END;
            END;
            lp := vlink 
         END 
      END;
      INC(datasize, globvarnext);
      IF datasize MOD oneword <> 0 THEN
         INC(datasize, oneword - datasize MOD oneword);
      END;
   END CalcDatasize;

   PROCEDURE ExportVars;
      VAR 
         lp: Idptr;
   BEGIN 
      (* (* not necessary *)
      lp := mainmodp^.globvarp;
      WHILE lp<>NIL DO 
         WITH lp^ DO 
	    (* may be exported *)
	    EmitExportedVarLabel(vaddr);
            lp := vlink;
         END 
      END;
      *)
      EmitVarEntry(mainmodp^.identifier);
   END ExportVars;

   PROCEDURE Init;
   BEGIN
      EmitFileName(sourcefilename);
      GlobalLab := global;
      Flag := flag;
      PutModuleHeader(mainmodp);
      PutImports;
      CalcDatasize;
      PutGlobal(datasize);
      ExportVars;
   END Init;

END MCP4Init. 
