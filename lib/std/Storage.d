DEFINITION MODULE Storage;              (* A. Borchert *)

   FROM SYSTEM IMPORT ADDRESS;

   PROCEDURE ALLOCATE(VAR a:ADDRESS; n: CARDINAL);

   PROCEDURE DEALLOCATE(VAR a:ADDRESS; n: CARDINAL);

   PROCEDURE Setmode(m: CARDINAL);

END Storage. 