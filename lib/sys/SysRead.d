DEFINITION MODULE SysRead;

   FROM SYSTEM IMPORT ADDRESS;

   PROCEDURE Read(fd: CARDINAL; ptr: ADDRESS;
                  VAR bytecount: CARDINAL) : BOOLEAN;

END SysRead.
