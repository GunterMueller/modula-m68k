DEFINITION MODULE Sys;
CONST (*SUN SYSTEM CALLS*)
 exit       = 1;      fork = 2;		read = 3; 	   write = 4;
 open       = 5;      close = 6;	creat = 8; 	   link = 9;
 unlink	   = 10;      execv = 11;	chdir = 12; 	   mknod = 14;
 chmod	   = 15;      chown = 16; 	lseek = 19; 	   getpid = 20;
 getuid	   = 24;      ptrace = 26;	access = 33;	   sync = 36;
 kill	   = 37;      stat = 38;	lstat = 40; 	   dup = 41;
 pipe	   = 42;      profil = 44;	getgid = 47;	   acct = 51; 
 ioctl     = 54;      reboot = 55 ;	symlink = 57; 	   readlink = 58;
 execve	   = 59;      umask = 60;	chroot = 61; 	   fstat = 62 ;
 getpagesize = 64;    mremap = 65;	sbrk = 17 (*69*);  sstk = 70;
 munmap	   = 73;      mprotect = 74;	madvise = 75; 	   vhangup = 76;
 mincore   = 78;      getgroups = 79; 	setgroups = 80;	   getpgrp = 81;
 setpgrp   = 82;      setitimer = 83; 	wait = 84;   	   swapon = 85;
 getitimer = 86;      gethostname = 87; sethostname = 88;  getdtablesize = 89;
 dup2  	   = 90;      getdopt = 91; 	fcntl = 92;	   select = 93;
 setdopt   = 94;      fsync = 95 ;	setpriority = 96;  socket = 97;
 connect   = 98;      accept = 99 ;	getpriority = 100; send = 101;
 recv	  = 102;      bind = 104;	setsockopt = 105;  listen = 106;
 sigvec	  = 108;      sigblock = 109; 	sigsetmask = 110;  sigpause = 111;
 sigstack = 112;      recvmsg = 113; 	sendmsg = 114;	   gettimeofday = 116;
 getrusage = 117;     getsockopt = 118; readv = 120;	   writev = 121;
 settimeofday = 122;  fchown = 123; 	fchmod = 124;	   recvfrom = 125;
 setreuid = 126;      setregid = 127; 	rename = 128;	   truncate = 129;
 ftruncate = 130;     flock = 131;	sendto = 133; 	   shutdown = 134;
 socketpair = 135;    mkdir = 136;	rmdir = 137; 	   utimes = 138;
 adjtime  = 140;      getpeername = 141; gethostid = 142;  getrlimit = 144;
 setrlimit = 145;     killpg = 146;	getsocknames = 150; nfssvc = 155;
 getdirentries = 156; statfs = 157;  	fstatfs = 158;	   unmount = 159;
 asyncdaemon = 160;   getfh = 161;    getdomainname = 162; setdomainname = 163;
 quotactl  = 165;     exportfs = 166;	mount = 167; 	   ustat = 168;
 semsys	   = 169;     msgsys = 170;	shmsys = 171;
 END Sys.
