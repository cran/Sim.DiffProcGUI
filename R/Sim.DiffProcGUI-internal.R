.ABMFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Flow of Arithmetic Brownian Motion ?",command=function(){print(help("ABMF"))},width=45)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
theta <- tclVar(2)
sigma <- tclVar(6)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(ABMF(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Coefficient of drift).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (Coefficient of diffusion)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=10,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=10,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.ABMGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Arithmetic Brownian Motion ?",command=function(){print(help("ABM"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
theta <- tclVar(2)
sigma <- tclVar(6)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-"1"
         tclvalue(t0)     <-"0"
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 28)
t0.entry      <- tkentry(tt, textvariable=t0,width = 28)
T.entry       <- tkentry(tt, textvariable=T,width = 28)
x0.entry      <- tkentry(tt, textvariable=x0,width = 28)
theta.entry   <- tkentry(tt, textvariable=theta,width = 28)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 28)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
         eval(substitute(ABM(N=N,t0=t0,T=T,x0=x0,theta=theta,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Coefficient of drift).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (Coefficient of diffusion)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BBFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Flow of Brownian Bridge ?",command=function(){print(help("BBF"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
y <- tclVar(3)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(y)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
y.entry       <- tkentry(tt, textvariable=y,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         y      <- as.numeric(tclObj(y))  
         output <- as.character(tclObj(output))
        eval(substitute(BBF(N=N,M=M,t0=t0,T=T,x0=x0,y=y,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y = 3.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Terminal value (y) : "), y.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BBGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Brownian Bridge ?",command=function(){print(help("BB"))},width=30)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
y <- tclVar(3)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(y)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 28)
t0.entry      <- tkentry(tt, textvariable=t0,width = 28)
T.entry       <- tkentry(tt, textvariable=T,width = 28)
x0.entry      <- tkentry(tt, textvariable=x0,width = 28)
y.entry       <- tkentry(tt, textvariable=y,width = 28)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         y      <- as.numeric(tclObj(y))  
         output <- as.character(tclObj(output))
        eval(substitute(BB(N=N,t0=t0,T=T,x0=x0,y=y,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y = 3.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Terminal value (y) :"), y.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BesselpGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Bessel Process ?",command=function(){print(help("Besselp"))},width=20)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
alpha <- tclVar(5)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(alpha)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 25)
M.entry       <- tkentry(tt, textvariable=M,width = 25)
t0.entry      <- tkentry(tt, textvariable=t0,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
x0.entry      <- tkentry(tt, textvariable=x0,width = 25)
alpha.entry   <- tkentry(tt, textvariable=alpha,width = 25)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         alpha  <- as.numeric(tclObj(alpha))  
         output <- as.character(tclObj(output))
        eval(substitute(Besselp(N=N,M=M,t0=t0,T=T,x0=x0,alpha=alpha,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1 (x0 =! 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (alpha >=2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Alpha : "), alpha.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BM2D <-
function(N=10000,t0=0,x0=0,T=1)
      {
t = seq(t0,T,length=N+1)
dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o[ which( u < 0.5) ]= -1
w1 = c(x0,cumsum(o)*sqrt(dt))
u1 = runif(N,0,1)
o1 = rep(1,N)
o1[ which( u1 < 0.5) ]= -1
w2 = c(x0,cumsum(o1)*sqrt(dt))
plot(w1,w2,las=1,lwd=3,type="l",xlab=expression(W[t]),ylab=expression(W[t]))
mtext("Brownian motion in 2D plane",line=2,cex=1.2) 
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),
      side = 1, line = 4, adj = 0.5, cex = .66)
}

.BMcovGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Empirical Covariance for Brownian Motion ?",command=function(){print(help("BMcov"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(200)
T <- tclVar(1)
C <- tclVar(1)
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(C)      <-""
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 28)
M.entry      <- tkentry(tt, textvariable=M,width = 28)
T.entry       <- tkentry(tt, textvariable=T,width = 28)
C.entry      <- tkentry(tt, textvariable=C,width = 28)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M     <- as.numeric(tclObj(M))
         T      <- as.numeric(tclObj(T))
         C     <- as.numeric(tclObj(C))
        eval(substitute(BMcov(N=N,M=M,T=T,C=C)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 200.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="if C = 1 it is Standard Brownian Motion.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant positive (C) : "), C.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMEuler <-
function()
        {
N  = 5000
T  = 10
t0 = 0
x0 = 0
a     <- expression (0)
sigma <- expression(1)
t = seq(t0,T,length=N)
dt = (T-t0)/N
u = runif(N-1,0,1)
AA = rep(1,N-1)
AA[ which( u < 0.5) ]= -1
w = c(x0,cumsum(AA)*sqrt(dt))
plot(t,w,las=1,lwd=3,type="l",xlab="time",ylab=expression(W[t]),main="Brownian Trajectory")
mtext("Brownian trajectory Approxsime by Euler scheme",adj=0,col="red",line=0.25,cex=0.8)
mtext(bquote(x[.(t0)]==.(x0)),line=0.1,adj=1,cex=1,col="red")
mtext(bquote(t[.(x0)]==.(t0)),line=0.9,adj=1,cex=1,col="red")
legend("topleft",bg="gray85",border="gray",c("Euler Scheme"),lty=c(1),col=c("red"),lwd=2)
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria 07/04/2010 18:27:55"),
      side = 1, line = 4, adj = 0.5, cex = .66)
D    <- diff(w)
X    <- numeric(N)
X[1] <- x0
A   <- function(t,x)  eval(a)
S   <- function(t,x)  eval(sigma)
op = par(pch = 19)
for (i in 2:N)    {X[i] = X[i-1] + A(t[i-1],X[i-1])*dt + S(t[i-1],X[i-1])*D[i-1]}
for (i in 1:(N-1)){lines(c(t[i],t[i+1]),c(X[i],X[i+1]),type="l",col="red",panel.frist=grid(col="gray"))}
par(op)
}

.BMinfGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Limit for Brownian Motion ?",command=function(){print(help("BMinf"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1000)
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 28)
T.entry       <- tkentry(tt, textvariable=T,width = 28)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))
        eval(substitute(BMinf(N=N,T=T)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMIrtGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Invariance by Reversal of Time ?",command=function(){print(help("BMIrt"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(10)
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))
        eval(substitute(BMIrt(N=N,T=T)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMIto2GUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Ito integral(W(s)dW(s),0,t) ?",command=function(){print(help("BMIto1"))},width=45)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         output <- as.character(tclObj(output))
        eval(substitute(BMIto2(N=N,T=T,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=5,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=5,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMItoCGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Ito integral(alpha*dW(s),0,t) ?",command=function(){print(help("BMItoC"))},width=45)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
alpha <- tclVar(4)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(alpha)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
alpha.entry   <- tkentry(tt, textvariable=alpha,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         alpha  <- as.numeric(tclObj(alpha))  
         output <- as.character(tclObj(output))
        eval(substitute(BMItoC(N=N,T=T,alpha=alpha,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example alpha = 4).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Alpha : "), alpha.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=6,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=6,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMItoPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Ito integral(W(s)^n*dW(s),0,t) ?",command=function(){print(help("BMItoP"))},width=50)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
power <- tclVar(3)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(power)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
power.entry   <- tkentry(tt, textvariable=power,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         power  <- as.numeric(tclObj(power))  
         output <- as.character(tclObj(output))
        eval(substitute(BMItoP(N=N,T=T,power=power,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example n = 3).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Power (n) : "), power.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=6,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=6,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMItoTGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Ito integral(s*dW(s),0,t) ?",command=function(){print(help("BMItoT"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))   
         output <- as.character(tclObj(output))
        eval(substitute(BMItoT(N=N,T=T,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=5,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=5,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMNFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Flow of Brownian Motion by The Normal Distribution ?",command=function(){print(help("BMNF"))},width=50)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(100)
t0 <- tclVar(0)
C <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(C)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
C.entry       <- tkentry(tt, textvariable=C,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N)) 
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         C      <- as.numeric(tclObj(C))
         output <- as.character(tclObj(output))
        eval(substitute(BMNF(N=N,M=M,t0=t0,T=T,C=C,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="if C = 1 it is Standard Brownian Motion.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant positive (C) : "), C.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMNGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Brownian Motion by The Normal Distribution ?",command=function(){print(help("BMN"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(100)
t0 <- tclVar(0)
C <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)<-""
         tclvalue(T)<-""
         tclvalue(t0)<-""
         tclvalue(C)<-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
C.entry       <- tkentry(tt, textvariable=C,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))   
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         C      <- as.numeric(tclObj(C))
         output <- as.character(tclObj(output))
        eval(substitute(BMN(N=N,t0=t0,T=T,C=C,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="if C = 1 it is Standard Brownian Motion.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant positive (C) : "), C.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=7,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=7,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Trajectories Brownian Lies Between The Two Curves ?",command=function(){print(help("BMP"))},width=50)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(20)
T <- tclVar(1)
C <- tclVar(1)
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)     <-""
         tclvalue(C)     <-""
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry      <- tkentry(tt, textvariable=M,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
C.entry      <- tkentry(tt, textvariable=C,width = 30)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M     <- as.numeric(tclObj(M))
         T      <- as.numeric(tclObj(T))
         C     <- as.numeric(tclObj(C))
        eval(substitute(BMP(N=N,M=M,T=T,C=C)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 20.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="if C = 1 it is Standard Brownian Motion.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant positive (C) : "), C.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMRWFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Flow of Brownian Motion by a Random Walk ?",command=function(){print(help("BMRWF"))},width=45)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(100)
t0 <- tclVar(0)
C <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(C)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 34)
M.entry       <- tkentry(tt, textvariable=M,width = 34)
t0.entry      <- tkentry(tt, textvariable=t0,width = 34)
T.entry       <- tkentry(tt, textvariable=T,width = 34)
C.entry       <- tkentry(tt, textvariable=C,width = 34)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N)) 
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         C      <- as.numeric(tclObj(C))
         output <- as.character(tclObj(output))
        eval(substitute(BMRWF(N=N,M=M,t0=t0,T=T,C=C,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="if C = 1 it is Standard Brownian Motion.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant positive (C) : "), C.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMRWGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Brownian Motion by a Random Walk ?",command=function(){print(help("BMRW"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(100)
t0 <- tclVar(0)
C <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)<-""
         tclvalue(T)<-""
         tclvalue(t0)<-""
         tclvalue(C)<-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
C.entry       <- tkentry(tt, textvariable=C,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))   
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         C      <- as.numeric(tclObj(C))
         output <- as.character(tclObj(output))
        eval(substitute(BMRW(N=N,t0=t0,T=T,C=C,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="if C = 1 it is Standard Brownian Motion.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant positive (C) : "), C.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=7,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=7,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMscalGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Brownian Motion invariance by scaling ?",command=function(){print(help("BMscal"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
S1 <- tclVar(1)
S2 <- tclVar(1.1)
S3 <- tclVar(1.2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(S1)     <-""
         tclvalue(S2)     <-""
         tclvalue(S3)     <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
S1.entry      <- tkentry(tt, textvariable=S1,width = 30)
S2.entry      <- tkentry(tt, textvariable=S2,width = 30)
S3.entry      <- tkentry(tt, textvariable=S3,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))
         S1     <- as.numeric(tclObj(S1))
         S2     <- as.numeric(tclObj(S2))
         S3     <- as.numeric(tclObj(S3))  
         output <- as.character(tclObj(output))
        eval(substitute(BMscal(N=N,T=T,S1=S1,S2=S2,S3=S3,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example S1 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Scale 1 (S1) : "), S1.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example S2 = 1.1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Scale 2 (S2) : "), S2.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example S3 = 1.2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Scale 3 (S3) : "), S3.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMStraCGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Stratonovitch integral(alpha o dW(s),0,t) ?",command=function(){print(help("BMStraC"))},width=55)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
alpha <- tclVar(4)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(alpha)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 41)
T.entry       <- tkentry(tt, textvariable=T,width = 41)
alpha.entry   <- tkentry(tt, textvariable=alpha,width = 41)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         alpha  <- as.numeric(tclObj(alpha))  
         output <- as.character(tclObj(output))
        eval(substitute(BMStraC(N=N,T=T,alpha=alpha,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example alpha = 4).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Alpha : "), alpha.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=6,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=6,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMStraGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Stratonovitch integral(W(s) o dW(s),0,t) ?",command=function(){print(help("BMStra"))},width=55)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 39)
T.entry       <- tkentry(tt, textvariable=T,width = 39)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         output <- as.character(tclObj(output))
        eval(substitute(BMStra(N=N,T=T,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=5,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=5,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMStraPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Stratonovitch integral(W(s)^n o dW(s),0,t) ?",command=function(){print(help("BMStraP"))},width=55)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
power <- tclVar(3)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(power)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 42)
T.entry       <- tkentry(tt, textvariable=T,width = 42)
power.entry   <- tkentry(tt, textvariable=power,width = 42)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         power  <- as.numeric(tclObj(power))  
         output <- as.character(tclObj(output))
        eval(substitute(BMStraP(N=N,T=T,power=power,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example n = 3).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Power (n) : "), power.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=6,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=6,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMStraTGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation of the Stratonovitch integral(s o dW(s),0,t) ?",command=function(){print(help("BMStraT"))},width=55)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 35)
T.entry       <- tkentry(tt, textvariable=T,width = 35)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))   
         output <- as.character(tclObj(output))
        eval(substitute(BMStraT(N=N,T=T,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=5,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=5,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.CEVGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Constant Elasticity of Variance (CEV) Models ?",command=function(){print(help("CEV"))},width=46)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0.1)
mu <- tclVar(0.3)
sigma <- tclVar(2)
gamma <- tclVar(1.2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(mu)     <-""
         tclvalue(sigma)  <-""
         tclvalue(gamma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
mu.entry      <- tkentry(tt, textvariable=mu,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
gamma.entry   <- tkentry(tt, textvariable=gamma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         mu     <- as.numeric(tclObj(mu))
         sigma  <- as.numeric(tclObj(sigma))
         gamma  <- as.numeric(tclObj(gamma))  
         output <- as.character(tclObj(output))
        eval(substitute(CEV(N=N,M=M,t0=t0,T=T,x0=x0,mu=mu,sigma=sigma,gamma=gamma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (mu * X(t) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mu : "), mu.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma * X(t)^gamma :diffusion coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma * X(t)^gamma :diffusion coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Gamma : "), gamma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.CIRGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Cox-Ingersoll-Ross (CIR) Models ?",command=function(){print(help("CIR"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0.2)
theta <- tclVar(0.1)
r     <- tclVar(0.2)
sigma <- tclVar(0.05)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
r.entry       <- tkentry(tt, textvariable=r,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(CIR(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( (r - theta * X(t)) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( (r - theta * X(t)) :drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( sigma * sqrt(X(t)) :diffusion coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.CIRhyGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="The Modified CIR and Hyperbolic Process ?",command=function(){print(help("CIRhy"))},width=46)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(1)
r     <- tclVar(0.3)
sigma <- tclVar(0.9)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
r.entry       <- tkentry(tt, textvariable=r,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(CIRhy(N=N,M=M,t0=t0,T=T,x0=x0,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant ( -r * X(t) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( sigma * sqrt(1+X(t)^2) :diffusion coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=10,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=10,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.CKLSGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Chan-Karolyi-Longstaff-Sanders (CKLS) Models ?",command=function(){print(help("CKLS"))},width=55)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
r     <- tclVar(0.3)
theta <- tclVar(0.01)
sigma <- tclVar(0.1)
gamma <- tclVar(0.2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(r)      <-""
         tclvalue(theta)  <-""
         tclvalue(sigma)  <-""
         tclvalue(gamma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
r.entry       <- tkentry(tt, textvariable=r,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
gamma.entry   <- tkentry(tt, textvariable=gamma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         r      <- as.numeric(tclObj(r))
         theta  <- as.numeric(tclObj(theta))
         sigma  <- as.numeric(tclObj(sigma)) 
         gamma  <- as.numeric(tclObj(gamma)) 
         output <- as.character(tclObj(output))
        eval(substitute(CKLS(N=N,M=M,t0=t0,T=T,x0=x0,r=r,theta=theta,sigma=sigma,gamma=gamma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant ( (r + theta *X(t)) :drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant ( (r + theta *X(t)) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( sigma * X(t)^gamma :diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( sigma * X(t)^gamma :diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Gamma : "), gamma.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=12,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.diffBridgeGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Diffusion Bridge Model ?",command=function(){print(help("diffBridge"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(100)
t0 <- tclVar(0)
x <- tclVar(0)
y <- tclVar(1.5)
drift <- tclVar("expression((0.03 * t * x - x^3))")
sigma <- tclVar("expression((0.1))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x)      <-""
         tclvalue(y)      <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x.entry       <- tkentry(tt, textvariable=x,width = 30)
y.entry       <- tkentry(tt, textvariable=y,width = 30)
drift.entry       <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x      <- as.numeric(tclObj(x))
         y      <- as.numeric(tclObj(y))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(diffBridge(N=N,t0=t0,T=T,x=x,y=y,drift=eval(e1),diffusion=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x) : "), x.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="y = 1.5.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Terminal value (y) : "), y.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=10,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=10,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.DWPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Double-Well Potential Model ?",command=function(){print(help("DWP"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))  
         output <- as.character(tclObj(output))
        eval(substitute(DWP(N=N,M=M,t0=t0,T=T,x0=x0,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Euler <-
function(N,M,T=1,t0,x0,Dt,a,sigma,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if (M < 1)
            stop(tkmessageBox(title="Error",message=paste( "M must be >= 1" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(a))
            stop(tkmessageBox(title="Error",message=paste( "The coefficient of drift must be expressions f(t,X)" ),icon="error"))

if(!is.expression(sigma))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X)" ),icon="error"))

Eul <- function(N,T=1,Dt,t0,x0,a,sigma)
     {

A    <- function(t,x)  eval(a)
S    <- function(t,x)  eval(sigma)
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){X[i] = X[i-1] + A(t[i-1],X[i-1])*Dt + S(t[i-1],X[i-1])*D[i-1]}      
X
   }
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
Q = sapply(rep(N,length=M),Eul,T=T,t0=t0,x0=x0,Dt=Dt,a=a,sigma=sigma)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("Euler scheme":dX[t]== a(t,X[t])*dt+sigma(t,X[t])*dW[t]),line=3,cex=1.2,adj=0.5)
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="blue")
legend("topleft",bg="gray85",border="gray",c("Average trajectory"),lty=c(1),col=c("blue"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Euler.xlsx", sheetName="Sheet 1", formatTemplate=NULL,
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
return(invisible(Result))
    }

.EulerGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Euler Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(1)
T  <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
Dt <- tclVar(0.1)
drift <- tclVar("expression((0.03 * t * x - x^3))")
sigma <- tclVar("expression((0.1))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(.Euler(N=N,M=M,t0=t0,T=1,x0=x0,Dt=Dt,a=eval(e1),sigma=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.flow <-
function()
       {
N = 1000
M = 50
T = 1
t0 = 0
x0 = 0
Dt = (T-t0)/N
Eul <- function(N,T,Dt,t0,x0)
     {
a     <- expression(3*x)
sigma <- expression(2)
A     <- function(t,x)  eval(a)
S     <- function(t,x)  eval(sigma)

t = seq(t0,T,length=N+1)
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){X[i] = X[i-1] + A(t[i-1],X[i-1])*Dt + S(t[i-1],X[i-1])*D[i-1]}      
X
   }
t = seq(t0,T,length=N+1)
Q = sapply(rep(N,length=M),Eul,T=T,t0=t0,x0=x0,Dt=Dt)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("flow of ":dX[t]== 3*X[t]*dt+2*dW[t]),line=2,cex=1.2,adj=0.5,col="blue")
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(bquote(M==.(M)),line=0.4,cex=1,adj=0,col="red")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=0.9,adj=1,col="red")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=0.9,adj=1,col="red")
lines(t,Q.mean,lwd=2,col="red")
legend(c(t0,t0),c(r2,r2),c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
    }

.GBMFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Flow of Geometric Brownian Motion ?\n                   Model of Black-Scholes?",command=function(){print(help("GBMF"))},width=50)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
theta <- tclVar(4)
sigma <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(GBMF(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 > 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (theta is the constant interest rateand and theta * X(t) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma is volatility of risky activities and sigma * X(t):diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=10,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=10,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.GBMGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Geometric Brownian Motion ?\n             Model of Black-Scholes?",command=function(){print(help("GBM"))},width=50)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
theta <- tclVar(4)
sigma <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(GBM(N=N,t0=t0,T=T,x0=x0,theta=theta,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 > 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (theta is the constant interest rateand and theta * X(t) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma is volatility of risky activities and sigma * X(t):diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Heun <-
function(N,M,T=1,t0,x0,Dt,a,sigma,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if (M < 1)
            stop(tkmessageBox(title="Error",message=paste( "M must be >= 1" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(a))
            stop(tkmessageBox(title="Error",message=paste( "The coefficient of drift must be expressions f(t,X)" ),icon="error"))

if(!is.expression(sigma))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X)" ),icon="error"))

H <- function(N,T=1,Dt,t0,x0,a,sigma)
   {
A    <- function(t,x)  eval(a)
S    <- function(t,x)  eval(sigma)
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric()
Y    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){
         Y[i-1]= X[i-1]+A(t[i-1],X[i-1])*Dt+S(t[i-1],X[i-1])*D[i-1]
         X[i]  = X[i-1]+0.5*Dt*(A(t[i-1],X[i-1])+A(t[i-1],Y[i-1]))+
                 0.5*(S(t[i-1],X[i-1])+S(t[i-1],Y[i-1]))*D[i-1]
               }          
X      
   }
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
Q = sapply(rep(N,length=M),H,t0=t0,T=T,x0=x0,Dt=Dt,a=a,sigma=sigma)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("Heun scheme":dX[t]== a(t,X[t])*dt+sigma(t,X[t])*dW[t]),line=3,cex=1.2,adj=0.5)
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="blue")
legend("topleft",bg="gray85",border="gray",c("Average trajectory"),lty=c(1),col=c("blue"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Heun.xlsx", sheetName="Sheet 1", formatTemplate=NULL,
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
return(invisible(Result))
    }

.HeunGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Heun Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(10)
T  <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
Dt <- tclVar(0.1)
drift <- tclVar("expression((0.03*t*x^4-x))")
sigma <- tclVar("expression((0.1))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(.Heun(N=N,M=M,t0=t0,T=1,x0=x0,Dt=Dt,a=eval(e1),sigma=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.HWVFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Flow of Hull-White/Vasicek (HWV)? \n     Gaussian Diffusion Models ?",command=function(){print(help("HWVF"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(10)
theta <- tclVar(2.5)
r <- tclVar(4)
sigma <- tclVar(1.2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
r.entry       <- tkentry(tt, textvariable=r,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(HWVF(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (theta is the long-run equilibrium value of the process and r*(theta -X(t)) :drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (r is speed of reversion and r*(theta -X(t)):drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma (Volatility) :diffusion coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.HWVGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Hull-White/Vasicek (HWV)? \nGaussian Diffusion Models ?",command=function(){print(help("HWV"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(10)
theta <- tclVar(2.5)
r <- tclVar(4)
sigma <- tclVar(1.2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
r.entry       <- tkentry(tt, textvariable=r,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(HWV(N=N,t0=t0,T=T,x0=x0,theta=theta,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (theta is the long-run equilibrium value of the process and r*(theta -X(t)) :drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (r is speed of reversion and r*(theta -X(t)):drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma (Volatility) :diffusion coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=10,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=10,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.HyprocgGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="General Hyperbolic Diffusion ?",command=function(){print(help("Hyprocg"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(2)
T <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(-10)
beta   <- tclVar(0.25)
gamma <- tclVar(0.5)
theta <- tclVar(2)
mu    <- tclVar(1)
sigma <- tclVar(2)

output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(beta)   <-""
         tclvalue(gamma)  <-""
         tclvalue(theta)  <-""
         tclvalue(mu)     <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
beta.entry    <- tkentry(tt, textvariable=beta,width = 26)
gamma.entry   <- tkentry(tt, textvariable=gamma,width = 26)
theta.entry   <- tkentry(tt, textvariable=theta,width = 26)
mu.entry      <- tkentry(tt, textvariable=mu,width = 26)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         beta   <- as.numeric(tclObj(beta))
         gamma  <- as.numeric(tclObj(gamma))
         theta  <- as.numeric(tclObj(theta))
         mu     <- as.numeric(tclObj(mu))
         sigma  <- as.numeric(tclObj(sigma)) 
         output <- as.character(tclObj(output))
        eval(substitute(Hyprocg(N=N,M=M,t0=t0,T=T,x0=x0,beta=beta,gamma=gamma,theta=theta,mu=mu,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = -10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (0.5*sigma^2*(beta-(gamma*X(t))/sqrt(theta^2+(X(t)-mu)^2)):drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Beta : "), beta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (0.5*sigma^2*(beta-(gamma*X(t))/sqrt(theta^2+(X(t)-mu)^2)):drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Gamma : "), gamma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (0.5*sigma^2*(beta-(gamma*X(t))/sqrt(theta^2+(X(t)-mu)^2)):drift coefficient). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (0.5*sigma^2*(beta-(gamma*X(t))/sqrt(theta^2+(X(t)-mu)^2)):drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mu : "), mu.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( sigma :diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.HyprocGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Hyperbolic Process ?",command=function(){print(help("Hyproc"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(10)
theta <- tclVar(1.5)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
theta.entry   <- tkentry(tt, textvariable=theta,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta)) 
         output <- as.character(tclObj(output))
        eval(substitute(Hyproc(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.importDataGUI <-
function()
           {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
SNEnv <- function()
{
  pos <- match("SNEnv", search())
  if (is.na(pos)) { # Must create it
    SNEnv <- list()
    attach(SNEnv, pos = length(search()) - 1)
    rm(SNEnv)
    pos <- match("SNEnv", search())
  }
  return(pos.to.env(pos))
}

rmSN <- function (x, ...) 
{
  rm (list=as.character (substitute (x)), envir = SNEnv(), ...)    
}

existsSN <- function (x, ...) 
{
  exists (as.character (substitute (x)), envir = SNEnv(), ...)
}

putSN <- function(x, value) 
{
  if (missing (value)) {
    value <- x
  }
  assign (as.character (substitute (x)), value, envir = SNEnv())
}

txtfile <- function(dataFile)  {
     Data <- read.table(dataFile, header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
     attach(Data)
     assign("myData",Data,envir=.GlobalEnv)
showData(Data, placement = "+200-200", font = "Courier 11",body.textcolor = "black")
Data
}

datfile <- function(dataFile)  {
     Data <- read.table(dataFile, header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
     attach(Data)
     assign("myData",Data,envir=.GlobalEnv)
showData(Data, placement = "+200-200", font = "Courier 11",body.textcolor = "black")
Data
}

csvfile <- function(dataFile)  {
     Data <- read.csv(dataFile,header = TRUE)
     attach(Data)
     assign("myData",Data,envir=.GlobalEnv)
showData(Data, placement = "+200-200", font = "Courier 11",body.textcolor = "black")
Data
}


xlsxfile <- function(dataFile)  
          {
     Data <- read.xlsx(dataFile,1)
     attach(Data)
     assign("myData",Data,envir=.GlobalEnv)
showData(Data, placement = "+200-200", font = "Courier 11",body.textcolor = "black")
Data
}

availableDataFormat <- c(".xlsx", ".txt",".dat", ".csv")
allDataFormat <- c("{{All files} *} {{Xlsx files} {.xlsx}}",
                   "{{All files} *} {{Tab Delimited} {.txt}}", 
                   "{{All files} *} {{Tab Delimited} {.dat}}",   
                   "{{All files} *} {{Comma-delimited files} {.csv}}")  
names (allDataFormat) <- availableDataFormat
readFunctions <- c( function (dataFile) {xlsxfile(dataFile)},
                    function (dataFile) {txtfile(dataFile)},
                    function (dataFile) {datfile(dataFile)},
                    function (dataFile) {csvfile(dataFile)})
names (readFunctions) <- availableDataFormat

generateReadCommand <- function (choice) {
    return (function () {
          dataFile <- tclvalue(tkgetOpenFile(filetypes=allDataFormat[choice]))
          if (dataFile == "") {
            return (NULL)
          }
          if (existsSN (Data)) {
            rmSN (Data)    
          }
          ##if (existsSN (info)) {
          ##  rmSN (info)    
          ##}  
          Data <- readFunctions[[choice]](dataFile)
          tkdestroy (ttI)
        })
  }
  onChange <- function () {
   getDataButton <- tkbutton(ttI, text="Select a Data File",width=20,command=generateReadCommand(as.character(tclvalue(dataFormat))))
    
   tkgrid(getDataButton, row=2, column=1)
  }
ttI <- tktoplevel(width=400, height=50)
tkwm.resizable(ttI, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(ttI, Rico)
tk2ico.destroy(Rico)
rm(Rico)
tktitle (ttI) <- "Sim.DiffProc" 
dataFormat <- tclVar(availableDataFormat[1])
dataFormat.comboBox <- ttkcombobox(ttI, values=availableDataFormat, textvariable=dataFormat, width=20)
tkgrid (tklabel(ttI, text="Import Data From...", font=tkfont.create(size=10,weight="bold"),foreground="blue"), row=0, column=1)
tkgrid (tklabel(ttI, text="Choose a Data Format"), row=1, column=0)
tkgrid (dataFormat.comboBox, row=2, column=0, sticky="e")
tkbind (dataFormat.comboBox, "<<ComboboxSelected>>", onChange)  
exitButton <- tkbutton(ttI, text="Exit", command=function() tkdestroy(ttI), width=20)
tkgrid(exitButton, row=2, column=2,sticky="w")
onChange()
tkfocus(ttI)  
})
}

.INFSRGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Inverse of Feller Square Root Models ?",command=function(){print(help("INFSR"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0.2)
theta <- tclVar(0.1)
r     <- tclVar(0.2)
sigma <- tclVar(0.05)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
theta.entry   <- tkentry(tt, textvariable=theta,width = 26)
r.entry       <- tkentry(tt, textvariable=r,width = 26)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(INFSR(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant ( X(t)*(theta-(sigma^3-theta*r)*X(t)) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant ( X(t)*(theta-(sigma^3-theta*r)*X(t)) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( sigma * X(t)^(3/2) :diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.ItovsStraGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral vs Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
tkgrid(tklabel(tt, text = "Integral(W(s)dW(s),0,t) vs Integral(W(s) o dW(s),0,t)", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=2)
N <- tclVar(1000)
T <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 35)
T.entry       <- tkentry(tt, textvariable=T,width = 35)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         output <- as.character(tclObj(output))
        eval(substitute(ItovsStra(N=N,T=T,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=5,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=5,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.ItovsStraPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral vs Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
tkgrid(tklabel(tt, text = "Integral(W(s)^n*dW(s),0,t) vs Integral(W(s)^n o dW(s),0,t)", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=2)
N <- tclVar(1000)
T <- tclVar(1)
power <- tclVar(3)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(power)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 42)
T.entry       <- tkentry(tt, textvariable=T,width = 42)
power.entry   <- tkentry(tt, textvariable=power,width = 42)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))  
         power  <- as.numeric(tclObj(power))  
         output <- as.character(tclObj(output))
        eval(substitute(ItovsStraP(N=N,T=T,power=power,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant (Example n = 3).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Power (n) : "), power.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=6,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=6,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.ItovsStraTGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Ito Integral vs Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
tkgrid(tklabel(tt, text = "Integral(s*dW(s),0,t) vs Integral(s o dW(s),0,t)", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=2)
N <- tclVar(1000)
T <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         T      <- as.numeric(tclObj(T))   
         output <- as.character(tclObj(output))
        eval(substitute(ItovsStraT(N=N,T=T,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=5,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=5,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.JDPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Jacobi Diffusion Process ?",command=function(){print(help("JDP"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
theta <- tclVar(0.05)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-"0"
         tclvalue(theta)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
theta.entry   <- tkentry(tt, textvariable=theta,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta)) 
         output <- as.character(tclObj(output))
        eval(substitute(JDP(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="0 =< x0 <= 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.MartExpGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Exponential Martingales Process ?",command=function(){print(help("MartExp"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
sigma <- tclVar(2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(MartExp(N=N,t0=t0,T=T,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (sigma is Volatility)..",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=7,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=7,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Milstein <-
function(N,M,T=1,t0,x0,Dt,a,sigma,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if (M < 1)
            stop(tkmessageBox(title="Error",message=paste( "M must be >= 1" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(a))
            stop(tkmessageBox(title="Error",message=paste( "The coefficient of drift must be expressions f(t,X)" ),icon="error"))

if(!is.expression(sigma))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X)" ),icon="error"))

Mils <- function(N,T=1,Dt,t0,x0,a,sigma)
   {
DSx  <- D(sigma,"x")
A    <- function(t,x)  eval(a)
S    <- function(t,x)  eval(sigma)
Sx   <- function(t,x)  eval(DSx)
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){
X[i] = X[i-1]+ A(t[i-1],X[i-1])*Dt + S(t[i-1],X[i-1])*D[i-1]+ 
       0.5 *S(t[i-1],X[i-1])*Sx(t[i-1],X[i-1])*((D[i-1])^2 -Dt)
              }
X      
   }
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
Q = sapply(rep(N,length=M),Mils,t0=t0,T=T,x0=x0,Dt=Dt,a=a,sigma=sigma)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("Milstein scheme":dX[t]== a(t,X[t])*dt+sigma(t,X[t])*dW[t]),line=3,cex=1.2,adj=0.5)
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="blue")
legend("topleft",bg="gray85",border="gray",c("Average trajectory"),lty=c(1),col=c("blue"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Milstein.xlsx", sheetName="Sheet 1", formatTemplate=NULL,
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
return(invisible(Result))
    }

.MilsteinGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Milstein Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(10)
T  <- tclVar(10)
t0 <- tclVar(0)
x0 <- tclVar(5)
Dt <- tclVar(0.01)
drift <- tclVar("expression((2*(1-x)))")
sigma <- tclVar("expression((1))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(.Milstein(N=N,M=M,t0=t0,T=T,x0=x0,Dt=Dt,a=eval(e1),sigma=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 5.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.01.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.MilsteinS <-
function(N,M,T=1,t0,x0,Dt,a,sigma,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if (M < 1)
            stop(tkmessageBox(title="Error",message=paste( "M must be >= 1" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(a))
            stop(tkmessageBox(title="Error",message=paste( "The coefficient of drift must be expressions f(t,X)" ),icon="error"))

if(!is.expression(sigma))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X)" ),icon="error"))

MilS <- function(N,T=1,Dt,t0,x0,a,sigma)
   {
DAx  <- D(a,"x")
DAxx <- D(D(a,"x"),"x")
DSx  <- D(sigma,"x")
DSxx <- D(D(sigma,"x"),"x")
A    <- function(t,x)  eval(a)
Ax   <- function(t,x)  eval(DAx)
Axx  <- function(t,x)  eval(DAxx)
S    <- function(t,x)  eval(sigma)
Sx   <- function(t,x)  eval(DSx)
Sxx  <- function(t,x)  eval(DSxx)
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){
X[i] = X[i-1] + A(t[i-1],X[i-1])*Dt + S(t[i-1],X[i-1])*D[i-1] +
       0.5 *S(t[i-1],X[i-1]) * Sx(t[i-1],X[i-1])*(D[i-1]^2-Dt)+ 
       Dt^(3 /2)*(0.5 *A(t[i-1],X[i-1])*Sx(t[i-1],X[i-1]) +
       0.5 *Ax(t[i-1],X[i-1])*S(t[i-1],X[i-1])+
       0.25 *(S(t[i -1] ,X[i -1])^2) * Sxx(t[i -1] ,X[i -1]))*D[i -1]+ 
       (Dt^2) * (0.5*A(t[i -1],X[i -1])*Ax(t[i-1],X[i-1])+
       0.25 *Axx(t[i-1],X[i-1])*(S(t[i-1],X[i-1])^2))
               }               
X      
   }
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
Q = sapply(rep(N,length=M),MilS,t0=t0,T=T,x0=x0,Dt=Dt,a=a,sigma=sigma)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("Second Milstein scheme":dX[t]== a(t,X[t])*dt+sigma(t,X[t])*dW[t]),line=3,cex=1.2,adj=0.5)
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="blue")
legend("topleft",bg="gray85",border="gray",c("Average trajectory"),lty=c(1),col=c("blue"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "MilsteinS.xlsx", sheetName="Sheet 1", formatTemplate=NULL,
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
return(invisible(Result))
    }

.MilsteinSGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Milstein Second Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(10)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
Dt <- tclVar(0.001)
drift <- tclVar("expression((3*x))")
sigma <- tclVar("expression((0.5*x))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(.MilsteinS(N=N,M=M,t0=t0,T=T,x0=x0,Dt=Dt,a=eval(e1),sigma=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.openFile <-
function() 
          {
local({fn<-choose.files(filters=Filters[c('R','txt','All'),],index=4)
file.show(fn,header=fn,title='')})
          }

.OUFGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Flow of Ornstein-Uhlenbeck Process ?",command=function(){print(help("OUF"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(10)
T <- tclVar(10)
t0 <- tclVar(0)
x0 <- tclVar(10)
r <- tclVar(2)
sigma <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
r.entry       <- tkentry(tt, textvariable=r,width = 26)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(OUF(N=N,M=M,t0=t0,T=T,x0=x0,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (r is speed of reversion and -r * X(t) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (Sigma (volatility) :diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=10,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=10,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.OUGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Ornstein-Uhlenbeck Process ?",command=function(){print(help("OU"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(10)
t0 <- tclVar(0)
x0 <- tclVar(10)
r <- tclVar(2)
sigma <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(r)      <-""
         tclvalue(sigma)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
r.entry       <- tkentry(tt, textvariable=r,width = 26)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         r      <- as.numeric(tclObj(r))
         sigma  <- as.numeric(tclObj(sigma))  
         output <- as.character(tclObj(output))
        eval(substitute(OU(N=N,t0=t0,T=T,x0=x0,r=r,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 10.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (r is speed of reversion and -r * X(t) :drift coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (Sigma (volatility) :diffusion coefficient).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.outgraph <-
function () 
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }

    tf <- tktoplevel()
    tkwm.title(tf, "Sim.DiffProc")
    tkwm.resizable(tf, 0,0)
    Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
    tk2ico.set(tf, Rico)
    tk2ico.destroy(Rico)
    frame1 <- tkframe(tf, relief = "groove", borderwidth = 2)
    frame2 <- tkframe(tf, relief = "groove", borderwidth = 2)
    frame3 <- tkframe(tf, relief = "groove", borderwidth = 2)
    devframe <- tkframe(frame2, relief = "groove", borderwidth = 2)
    done <- tclVar(0)
    formatvar <- tclVar(1)
    widthvar <- tclVar(6)
    heightvar <- tclVar(6)
    "savefic" <- function(formatvar, widthvar, heightvar) {
        outform <- tclvalue(formatvar)
        width <- as.numeric(tclvalue(widthvar))
        height <- as.numeric(tclvalue(heightvar))
        odev <- dev.cur()
        if (outform == 1) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.ps", 
                defaultextension = ".ps", title = "Save graph...", 
                filetypes = "{PostScript {.ps .eps}} {{All Files} {*.*}}"))
            if (filename != "") {
                postscript(file = filename, width = width, height = height)
            }
        }
        else if (outform == 2) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.pdf", 
                defaultextension = ".pdf", title = "Save graph...", 
                filetypes = "{PDF {.pdf}} {{All Files} {*.*}}"))
            if (filename != "") {
                pdf(file = filename, width = width, height = height)
            }
        }
        else if (outform == 3) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.tex", 
                defaultextension = ".tex", title = "Save graph...", 
                filetypes = "{PicTeX {.tex}} {{All Files} {*.*}}"))
            if (filename != "") {
                pictex(file = filename, width = width, height = height)
            }
        }
        else if (outform == 4) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.fig", 
                defaultextension = ".fig", title = "Save graph...", 
                filetypes = "{XFig {.fig}} {{All Files} {*.*}}"))
            if (filename != "") {
                xfig(file = filename, width = width, height = height)
            }
        }
        else if (outform == 5) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.png", 
                defaultextension = ".png", title = "Save graph...", 
                filetypes = "{PNG {.png}} {{All Files} {*.*}}"))
            if (filename != "") {
                png(file = filename, width = width, height = height)
            }
        }
        else if (outform == 6) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.jpeg", 
                defaultextension = ".jpeg", title = "Save graph...", 
                filetypes = "{JPEG {.jpeg .jpg}} {{All Files} {*.*}}"))
            if (filename != "") {
                jpeg(file = filename, width = width, height = height)
            }
        }
        ndev <- dev.cur()
        dev.set(odev)
        dev.copy(which = ndev)
        dev.off()
        tkdestroy(tf)
    }
    tkgrid(tklabel(tf, text = "Save graphic", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
        columnspan = 2)
    tkgrid(tklabel(frame2, text = "Output format : "), sticky = "n")
    tkgrid(tkradiobutton(frame2, text = "Postscript", value = 1, 
        variable = formatvar), sticky = "w")
    tkgrid(tkradiobutton(frame2, text = "Pdf", value = 2, variable = formatvar), 
        sticky = "w")
    tkgrid(tkradiobutton(frame2, text = "Pictex", value = 3, 
        variable = formatvar), sticky = "w")
    tkgrid(tkradiobutton(frame2, text = "Xfig", value = 4, variable = formatvar), 
        sticky = "w")
    tkgrid(tkradiobutton(frame2, text = "Png", value = 5, variable = formatvar), 
        sticky = "w")
    tkgrid(tkradiobutton(frame2, text = "Jpeg", value = 6, variable = formatvar), 
        sticky = "w")
    tkgrid(frame2, rowspan = 2, sticky = "n")
    tkgrid(tklabel(frame3, text = "Output size : "))
    width.entry <- tkentry(frame3, textvariable = widthvar, width = 10)
    height.entry <- tkentry(frame3, textvariable = heightvar, 
        width = 10)
    tkgrid(tklabel(frame3, text = "Width : "), width.entry)
    tkgrid(tklabel(frame3, text = "Height : "), height.entry)
    tkgrid(frame3, column = 1, row = 1, sticky = "n")
    save.but <- tkbutton(frame1, text = "Save", command = function() savefic(formatvar, 
        widthvar, heightvar))
    cancel.but <- tkbutton(frame1, text = "Cancel", command = function() tkdestroy(tf))
    tkgrid(save.but, cancel.but)
    tkgrid(frame1, column = 1, row = 2, sticky = "n")
    tkbind(tf, "<Destroy>", function() tclvalue(done) <- 2)
    tkbind(tf, "<KeyPress-Return>", function() savefic(formatvar, 
        widthvar, heightvar))
    tkbind(tf, "<KeyPress-Escape>", function() tkdestroy(tf))
    tkwait.variable(done)
    if (tclvalue(done) == "2") 
        return(0)
    tkdestroy(tf)
})
}

.pchShow <-
function(extras = c("*",".", "o","O","0","+","-","|","%","#"),
           cex = 3,
           col = "red3", bg = "gold", coltext = "brown", cextext = 1.2,
           main = paste("plot symbols :  points (...  pch = *, cex =",
                        cex,")"))
  {
    nex <- length(extras)
    np  <- 26 + nex
    ipch <- 0:(np-1)
    k <- floor(sqrt(np))
    dd <- c(-1,1)/2
    rx <- dd + range(ix <- ipch %/% k)
    ry <- dd + range(iy <- 3 + (k-1)- ipch %% k)
    pch <- as.list(ipch) # list with integers & strings
    if(nex > 0) pch[26+ 1:nex] <- as.list(extras)
    plot(rx, ry, type="n", axes = FALSE, xlab = "", ylab = "",
         main = main)
    abline(v = ix, h = iy, col = "lightgray", lty = "dotted")
    for(i in 1:11) {
      pc <- pch[[i]]
      points(ix[i], iy[i], pch = pc, col = col, bg = bg, cex = cex)
      if(cextext > 0)
          text(ix[i] - 0.3, iy[i], pc, col = coltext, cex = cextext)
    }
    for(i in 13:np) {
      pc <- pch[[i]]
      points(ix[i], iy[i], pch = pc, col = col, bg = bg, cex = cex)
      if(cextext > 0)
          text(ix[i] - 0.3, iy[i], pc, col = coltext, cex = cextext)
    }
  }

.PDPGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Pearson Diffusions Process ?",command=function(){print(help("PDP"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
theta <- tclVar(0.01)
mu <- tclVar(0.1)
a <- tclVar(0.2)
b <- tclVar(0.2)
c <- tclVar(0.2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(mu)     <-""
         tclvalue(a)      <-""
         tclvalue(b)      <-""
         tclvalue(c)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
x0.entry      <- tkentry(tt, textvariable=x0,width = 26)
theta.entry   <- tkentry(tt, textvariable=theta,width = 26)
mu.entry      <- tkentry(tt, textvariable=mu,width = 26)
a.entry       <- tkentry(tt, textvariable=a,width = 26)
b.entry       <- tkentry(tt, textvariable=b,width = 26)
c.entry       <- tkentry(tt, textvariable=c,width = 26)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta))
         mu     <- as.numeric(tclObj(mu)) 
         a      <- as.numeric(tclObj(a)) 
         b      <- as.numeric(tclObj(b))
         c      <- as.numeric(tclObj(c))
         output <- as.character(tclObj(output))
        eval(substitute(PDP(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,mu=mu,a=a,b=b,c=c,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mu : "), mu.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example a = 1",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant (a) : "), a.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example b = 1",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant (b) : "), b.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example c = 1",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Constant (c) : "), c.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PEABMGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Arithmetic Brownian Motion ?\n                       Exact likelihood Inference",command=function(){print(help("PEABM"))},width=50)
tkgrid(but,row=2,columnspan = 3)
data(DATA3)
dat  <- tclVar("DATA3")
delta <- tclVar(0.1)
theta <- tclVar(1)
sigma <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)      <-""
         tclvalue(delta)     <-""
         tclvalue(theta)     <-""
         tclvalue(sigma)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 42)
delta.entry   <- tkentry(tt, textvariable=delta,width = 42)
theta.entry   <- tkentry(tt, textvariable=theta,width = 42)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 42)
leve.entry    <- tkentry(tt, textvariable=leve,width = 42)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         delta   <- as.numeric(tclObj(delta))
         theta   <- as.numeric(tclObj(theta))
         sigma   <- as.numeric(tclObj(sigma))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(PEABM(X=eval(e1),delta=delta,starts = list(theta=theta, sigma=sigma),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA3)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example theta = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example sigma = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PEBSGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Black-Scholes Models ?\n                 Exact likelihood Inference",command=function(){print(help("PEBS"))},width=50)
tkgrid(but,row=2,columnspan = 3)
data(DATA2)
dat  <- tclVar("DATA2")
delta <- tclVar(0.001)
theta <- tclVar(1)
sigma <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)      <-""
         tclvalue(delta)     <-""
         tclvalue(theta)     <-""
         tclvalue(sigma)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 34)
delta.entry   <- tkentry(tt, textvariable=delta,width = 34)
theta.entry   <- tkentry(tt, textvariable=theta,width = 34)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 34)
leve.entry    <- tkentry(tt, textvariable=leve,width = 34)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         delta   <- as.numeric(tclObj(delta))
         theta   <- as.numeric(tclObj(theta))
         sigma   <- as.numeric(tclObj(sigma))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(PEBS(X=eval(e1),delta=delta,starts = list(theta=theta, sigma=sigma),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA2)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.001).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example theta = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example sigma = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PEOUexpGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Ornstein-Uhlenbeck Model ?\n                               Explicit Estimators",command=function(){print(help("PEOUexp"))},width=50)
tkgrid(but,row=2,columnspan = 3)
data(DATA1)
dat  <- tclVar("DATA1")
delta <- tclVar(0.001)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(delta)     <-""
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 40)
delta.entry   <- tkentry(tt, textvariable=delta,width = 40)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         delta   <- as.numeric(tclObj(delta))
         e1      <- try(parse(text=dat))
         eval(substitute(PEOUexp(X=eval(e1),delta=delta)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA1)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.001).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PEOUGGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Hull-White/Vasicek Model ?\n                    Exact likelihood Inference",command=function(){print(help("PEOUG"))},width=50)
tkgrid(but,row=2,columnspan = 3)
data(DATA1)
dat   <- tclVar("DATA1")
delta <- tclVar(0.001)
r     <- tclVar(1)
theta <- tclVar(1)
sigma <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(delta)     <-""
         tclvalue(r)         <-""
         tclvalue(theta)     <-""
         tclvalue(sigma)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 39)
delta.entry   <- tkentry(tt, textvariable=delta,width = 39)
r.entry       <- tkentry(tt, textvariable=r,width = 39)
theta.entry   <- tkentry(tt, textvariable=theta,width = 39)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 39)
leve.entry    <- tkentry(tt, textvariable=leve,width = 39)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         delta   <- as.numeric(tclObj(delta))
         r       <- as.numeric(tclObj(r))
         theta   <- as.numeric(tclObj(theta))
         sigma   <- as.numeric(tclObj(sigma))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(PEOUG(X=eval(e1),delta=delta,starts = list(r=r,theta=theta, sigma=sigma),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA1)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.001).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example r = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example theta = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example sigma = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PEOUGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Ornstein-Uhlenbeck Model ?\n                      Exact likelihood Inference",command=function(){print(help("PEOU"))},width=50)
tkgrid(but,row=2,columnspan = 3)
data(DATA1)
dat   <- tclVar("DATA1")
delta <- tclVar(0.001)
r     <- tclVar(1)
sigma <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(delta)     <-""
         tclvalue(r)         <-""
         tclvalue(sigma)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 40)
delta.entry   <- tkentry(tt, textvariable=delta,width = 40)
r.entry       <- tkentry(tt, textvariable=r,width = 40)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 40)
leve.entry    <- tkentry(tt, textvariable=leve,width = 40)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         delta   <- as.numeric(tclObj(delta))
         r       <- as.numeric(tclObj(r))
         sigma   <- as.numeric(tclObj(sigma))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(PEOU(X=eval(e1),delta=delta,starts = list(r=r,sigma=sigma),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA1)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.001).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example r = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="r : "), r.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example sigma = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.choosdata <-
function()
{
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tf <- tktoplevel()
tkwm.title(tf,"Sim.DiffProc~~Choose Dataframe")
done <- tclVar(0)
tlb <- tklistbox(tf)
scr <- tkscrollbar(tf,repeatinterval=5, command=function(...)tkyview(tlb,...))
tkconfigure(tlb, yscrollcommand=function(...)tkset(scr,...))
frame1 <- tkframe(tf, relief="groove", borderwidth=2)
cancel.but <- tkbutton(frame1, text="Quit", command=function()tkdestroy(tf))
submit.but <- tkbutton(frame1, text="Choose", default="active", command=function()tclvalue(done)<-1)
tkpack(cancel.but, submit.but, side="left")
tkpack(frame1, side="bottom")
tkpack(tlb, side="left", fill="both", expand=TRUE)
tkpack(scr, side="right", fill="y")
obj <- ls(globalenv())
flb <- function(x1) {
xobj <- get(x1, envir=globalenv())
if (is.data.frame(xobj)) {
tkinsert(tlb, "end", x1)
cbind(nrow(xobj),ncol(xobj))
} else if (is.list(xobj)) {
if (length(names(xobj)) != 0) {
fn1 <- function(x) {
sobjn <- paste(x1,"$",x,sep="")
sobj <- try(eval(parse(text=sobjn)), silent=TRUE)
if (is.data.frame(sobj)) {
tkinsert(tlb, "end", sobjn)
}
}
sapply(names(xobj), fn1)
fn2 <- function(x) {
sobjn <- paste(x1,"$",x,sep="")
sobj <- try(eval(parse(text=sobjn)), silent=TRUE)
if (is.data.frame(sobj)) {
cbind(nrow(sobj), ncol(sobj))
}
}
res <- sapply(names(xobj), fn2)
return(res)
}
}
}
v <- unlist(lapply(obj, flb))
if (length(v) > 0) {
vnr <- v[seq(from=1,to=length(v),by=2)]
vnc <- v[seq(from=2,to=length(v),by=2)]
}

tkbind(tlb, "<Double-ButtonPress-1>", function() tclvalue(done)<-1)
tkbind(tf, "<Destroy>", function() tclvalue(done)<-2)
tkbind(tf, "<KeyPress-Return>", function() tclvalue(done)<-1)
tkbind(tf, "<KeyPress-Escape>", function() tkdestroy(tf))

tkwait.variable(done)
if(tclvalue(done)=="2") return(0)
numc <- tclvalue(tkcurselection(tlb))
numi <- as.integer(numc)+1

if(numc == "") {
tkdestroy(tf)
return(0)
}

choix <- tclvalue(tkget(tlb, numc))
eval(parse(text=paste(choix, " <<- showData(", choix, ")", sep="")))
tkdestroy(tf)
})
}

.PredCorrGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Predictor-Corrector Method ?",command=function(){print(help("PredCorr"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(10)
T  <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
Dt <- tclVar(0.1)
alpha <- tclVar(0.5)
mu <- tclVar(0.5)
drift <- tclVar("expression((0.03*t*x-x^5))")
sigma <- tclVar("expression((0.1))")
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(alpha)  <-"0.5"
         tclvalue(mu)     <-"0.5"
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
alpha.entry   <- tkentry(tt, textvariable=alpha,width = 30)
mu.entry      <- tkentry(tt, textvariable=mu,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         alpha  <- as.numeric(tclObj(alpha))
         mu     <- as.numeric(tclObj(mu))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         output <- as.character(tclObj(output))
        eval(substitute(PredCorr(N=N,M=M,t0=t0,T=T,x0=x0,Dt=Dt,alpha=alpha,mu=mu,drift=eval(e1),diffusion=eval(e2),output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Weight Alpha of the predictor-corrector scheme. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Alpha : "), alpha.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Weight Mu of the predictor-corrector scheme.  ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mu : "), mu.entry, sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^5))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.RK3 <-
function(N,M,T=1,t0,x0,Dt,a,sigma,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if (M < 1)
            stop(tkmessageBox(title="Error",message=paste( "M must be >= 1" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(a))
            stop(tkmessageBox(title="Error",message=paste( "The coefficient of drift must be expressions f(t,X)" ),icon="error"))

if(!is.expression(sigma))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X)" ),icon="error"))

rk3 <- function(N,T=1,Dt,t0,x0,a,sigma)
   {
A    <- function(t,x)  eval(a)
S    <- function(t,x)  eval(sigma)
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){
              Y    <- numeric()
              Z    <- numeric()
              Y[i-1]=X[i-1]+0.5*Dt*A(t[i-1],X[i-1])+S(t[i-1],X[i-1])*D[i-1]
              Z[i-1]=X[i-1]-A(t[i-1],X[i-1])*Dt+2*Dt*A(t[i-1]+0.5*Dt,Y[i-1])+
                     (2*S(t[i-1]+0.5*Dt,Y[i-1])-S(t[i-1],X[i-1]))*D[i-1]
              X[i] = X[i-1]+(Dt/6)*(A(t[i-1],X[i-1])+4*A(t[i-1]+0.5*Dt,Y[i-1])+A(t[i-1]+Dt,Z[i-1]))+
                     (1/6)*(S(t[i-1],X[i-1])+4*S(t[i-1]+0.5*Dt,Y[i-1])+S(t[i-1]+Dt,Z[i-1]))*D[i-1]
               }          
X      
   }
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
Q = sapply(rep(N,length=M),rk3,t0=t0,T=T,x0=x0,Dt=Dt,a=a,sigma=sigma)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("Runge-Kutta scheme Order3":dX[t]== a(t,X[t])*dt+sigma(t,X[t])*dW[t]),line=3,cex=1.2,adj=0.5)
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="blue")
legend("topleft",bg="gray85",border="gray",c("Average trajectory"),lty=c(1),col=c("blue"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "RK3.xlsx", sheetName="Sheet 1", formatTemplate=NULL,
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
return(invisible(Result))
    }

.RK3GUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Runge-Kutta Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(10)
T  <- tclVar(100)
t0 <- tclVar(0)
x0 <- tclVar(0)
Dt <- tclVar(0.1)
drift <- tclVar("expression((0.03*t*x-x^5))")
sigma <- tclVar("expression((0.1))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(.RK3(N=N,M=M,t0=t0,T=T,x0=x0,Dt=Dt,a=eval(e1),sigma=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.ROUGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Radial Ornstein-Uhlenbeck Process ?",command=function(){print(help("ROU"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
M <- tclVar(1)
T <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
theta <- tclVar(0.05)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(x0)     <-""
         tclvalue(theta)  <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
theta.entry   <- tkentry(tt, textvariable=theta,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         M      <- as.numeric(tclObj(M))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         theta  <- as.numeric(tclObj(theta)) 
         output <- as.character(tclObj(output))
        eval(substitute(ROU(N=N,M=M,t0=t0,T=T,x0=x0,theta=theta,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" x0 =! 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Theta : "), theta.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.sde <-
function()
    {
plot(0:20,0:20,type="n",xlab="",axes=F,ylab="",main=expression("Stochastic Processes":dX[t]==(alpha+beta*X[t])*dt+sigma*X[t]^gamma*dW[t]))
mtext("financial and actuarial models",line=0.4,cex=1.2,col="blue")
mtext("models",adj=0.05,line=-1.3,cex=1.2,col="red")
mtext("Expressions ",adj=0.5,line=-1.3,cex=1.2,col="red")
mtext(expression(alpha),adj=0.82,line=-1.3,cex=1.2,col="red")
mtext(expression(beta),adj=0.9,line=-1.3,cex=1.2,col="red")
mtext(expression(gamma),adj=0.98,line=-1.3,cex=1.2,col="red")
mtext("Merton(1973)",adj=0.02,line=-3,cex=1)
mtext("Vasicek(1977)",adj=0.02,line=-5,cex=1)
mtext("CIR SR(1985)",adj=0.02,line=-7,cex=1)
mtext("Brennan &",adj=0.02,line=-9,cex=1)
mtext("Schwartz(1980)",adj=0.02,line=-10,cex=1)
mtext("CEV",adj=0.02,line=-12,cex=1)
mtext("Dothan(1978)",adj=0.02,line=-14,cex=1)
mtext("CIR VR(1980)",adj=0.02,line=-16,cex=1)
mtext("Black & Scholes",adj=0.02,line=-18.4,cex=1)
mtext("Longstaff(1989)",adj=0.02,line=-20.4,cex=1)
mtext(expression(dX[t]==alpha*dt+sigma*dW[t]),line=-3,adj=0.5,cex=1)
mtext(expression(dX[t]==(alpha+beta*X[t])*dt+sigma*dW[t]),line=-5,adj=0.5,cex=1)
mtext(expression(dX[t]==(alpha+beta*X[t])*dt+sigma*sqrt(X[t])*dW[t]),line=-7,adj=0.5,cex=1)
mtext(expression(dX[t]==(alpha+beta*X[t])*dt+sigma*X[t]*dW[t]),line=-9.5,adj=0.5,cex=1)
mtext(expression(dX[t]==beta*X[t]*dt+sigma*X[t]^gamma*dW[t]),line=-12,adj=0.5,cex=1)
mtext(expression(dX[t]==sigma*X[t]*dW[t]),line=-14,adj=0.5,cex=1)
mtext(expression(dX[t]==sigma*X[t]^frac(3,2)*dW[t]),line=-16.3,adj=0.5,cex=1)
mtext(expression(dX[t]==beta*X[t]*dt+sigma*X[t]*dW[t]),line=-18.4,adj=0.5,cex=1)
mtext(expression(dX[t]==(alpha+beta*sqrt(X[t]))*dt+sigma*sqrt(X[t])*dW[t]),line=-20.4,adj=0.55,cex=1)
mtext(expression(0),adj=0.9,line=-2.7,cex=1)
mtext(expression(0),adj=0.98,line=-2.7,cex=1)
mtext(expression(0),adj=0.98,line=-4.7,cex=1)
mtext(expression(frac(1,2)),adj=0.98,line=-7.7,cex=1)
mtext(expression(1),adj=0.98,line=-9.3,cex=1)
mtext(expression(0),adj=0.82,line=-11.7,cex=1)
mtext(expression(0),adj=0.82,line=-13.8,cex=1)
mtext(expression(0),adj=0.9,line=-13.8,cex=1)
mtext(expression(1),adj=0.98,line=-13.8,cex=1)
mtext(expression(0),adj=0.82,line=-16,cex=1)
mtext(expression(0),adj=0.9,line=-16,cex=1)
mtext(expression(frac(3,2)),adj=0.98,line=-17,cex=1)
mtext(expression(0),adj=0.82,line=-18.4,cex=1)
mtext(expression(0),adj=0.82,line=-18.4,cex=1)
mtext(expression(1),adj=0.98,line=-18.4,cex=1)
mtext("**",adj=0.9,line=-20.4,cex=1)
mtext("**",adj=0.98,line=-20.4,cex=1)
mtext("**",adj=0.82,line=-20.4,cex=1)
abline(v=-0.7,col="blue",lwd=4)
abline(h=-0.8,col="blue",lwd=4)
abline(h=20.7,col="blue",lwd=4)
abline(v=20.8,col="blue",lwd=4)
abline(v=5.1,col="blue",lwd=3)
abline(v=15.7,col="blue",lwd=3)
abline(h=19,col="blue",lwd=3)
abline(v=17.2,col="blue",lwd=3)
abline(v=19,col="blue",lwd=3)
abline(h=17,col="blue",lwd=3)
abline(h=15.2,col="blue",lwd=3)
abline(h=12.5,col="blue",lwd=3)
abline(h=9.8,col="blue",lwd=3)
abline(h=7.5,col="blue",lwd=3)
abline(h=5.6,col="blue",lwd=3)
abline(h=3.0,col="blue",lwd=3)
abline(h=1.2,col="blue",lwd=3)
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria 11/04/2010 03:08:42"),
      side = 1, line = 4, adj = 0.5, cex = .66)
}

.sde.sim <-
function()
        {
N  = 1000
t0 = 0
x0 = 0
T  = 100
Dt = (T-t0)/N
a     <- expression( (0.03*t*x-x^5) )
sigma <- expression( (0.1) )
A     <- function(t,x)  eval(a)
S     <- function(t,x)  eval(sigma)
t = seq(t0,T,length=N+1)
u = runif(N,0,1)
AAA = rep(1,N)
AAA [ which(u < 0.5) ] = -1
w = cumsum(c(0,AAA))*sqrt((T-t0)/N)
D    <- diff(w)
X    <- numeric(N+1)
X[1] <- x0
for (i in 2:(N+1)){
    X[i] = X[i-1] + A(t[i-1],X[i-1])*Dt + S(t[i-1],X[i-1])*D[i-1]
    plot(t,X,type="n",ylab=expression(X[t]),xlab="time",las=1,main=expression(dX[t]== (0.03*t*X[t]-X[t]^5)*dt+0.1*dW[t]))
    points(t,X,type="l",panel.frist=grid(col="gray"),col="blue")
    mtext(paste(date()),adj=0.5,col="blue",line=3.0,cex=1.4)
    mtext(bquote(t[i]==.(round(t[i],2))),adj=0,col="red",line=0.32,cex=1.2)
    mtext(bquote(X[t[i]]==.(round(X[i],2))),adj=0.2,col="red",line=0.2,cex=1.2)
    mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=0.9,adj=1,col="red")
    mtext(bquote(t[0]==.(t0)),line=0.9,cex=0.9,adj=1,col="red")
    mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria"),side = 1, line = 4, adj = 0.5, cex = .66)
    }
}

.setWd <-
function()
      {
    wd <- tclvalue(tkchooseDirectory(initialdir = getwd()))
    if (wd != ""){
      setwd (wd)
    }
  }

.SRWGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Random Walk ?",command=function(){print(help("SRW"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
p  <- tclVar(0.5)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(p)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
p.entry   <- tkentry(tt, textvariable=p,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         p      <- as.numeric(tclObj(p))  
         output <- as.character(tclObj(output))
        eval(substitute(SRW(N=N,t0=t0,T=T,p=p,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="probability of choosing X = -1 or +1. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Probability : "), p.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=7,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=7,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.StgammaGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Stochastic Process The Gamma Distribution ?",command=function(){print(help("Stgamma"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
alpha <- tclVar(2)
beta <- tclVar(2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(alpha)  <-""
         tclvalue(beta)   <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
alpha.entry   <- tkentry(tt, textvariable=alpha,width = 30)
beta.entry    <- tkentry(tt, textvariable=beta,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         alpha  <- as.numeric(tclObj(alpha))
         beta   <- as.numeric(tclObj(beta))  
         output <- as.character(tclObj(output))
        eval(substitute(Stgamma(N=N,t0=t0,T=T,alpha=alpha,beta=beta,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Alpha : "), alpha.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="An alternative way to specify the scale.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Beta : "), beta.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.STS <-
function(N,M,T=1,t0,x0,Dt,a,sigma,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if (M < 1)
            stop(tkmessageBox(title="Error",message=paste( "M must be >= 1" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(a))
            stop(tkmessageBox(title="Error",message=paste( "The coefficient of drift must be expressions f(t,X)" ),icon="error"))

if(!is.expression(sigma))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X)" ),icon="error"))

st <- function(N,T=1,Dt,t0,x0,a,sigma)
   {
DAx  <- D(a,"x")
DAxx <- D(D(a,"x"),"x")
DSx  <- D(sigma,"x")
DSxx <- D(D(sigma,"x"),"x")
A    <- function(t,x)  eval(a)
Ax   <- function(t,x)  eval(DAx)
Axx  <- function(t,x)  eval(DAxx)
S    <- function(t,x)  eval(sigma)
Sx   <- function(t,x)  eval(DSx)
Sxx  <- function(t,x)  eval(DSxx)
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
u = runif(N,0,1)
o = rep(1,N)
o [ which(u < 0.5) ] = -1
w = cumsum(c(0,o))*sqrt((T-t0)/N)
D    <- diff(w)
DZ= rnorm(N,0,sqrt((1/3)*Dt^3))
X    <- numeric()
X[1] <- x0
for (i in 2:(N+1)){
X[i]=X[i-1]+A(t[i-1],X[i-1])*Dt+S(t[i-1],X[i-1])*D[i-1]+
     0.5*S(t[i-1],X[i-1])*Sx(t[i-1],X[i-1])*((D[i-1]^2)-Dt)+
     Ax(t[i-1],X[i-1])*S(t[i-1],X[i-1])*DZ[i-1]+0.5*(A(t[i-1],X[i-1])*Ax(t[i-1],X[i-1])+
     0.5*(S(t[i-1],X[i-1])^2)*Axx(t[i-1],X[i-1]))*(Dt^2)+(A(t[i-1],X[i-1])*Sx(t[i-1],X[i-1])+
     0.5*(S(t[i-1],X[i-1])^2)*Sxx(t[i-1],X[i-1]))*(D[i-1]*Dt-DZ[i-1])+
     0.5*S(t[i-1],X[i-1])*(S(t[i-1],X[i-1])*Sxx(t[i-1],X[i-1])+
     (Sx(t[i-1],X[i-1])^2))*((1/3)*(D[i-1]^2)-Dt)*D[i-1]
                }            
X      
   }
if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
Q = sapply(rep(N,length=M),st,t0=t0,T=T,x0=x0,Dt=Dt,a=a,sigma=sigma)
Q.mean <- apply(Q,1,mean)
r1 <- min(apply(Q,2,min))
r2 <- max(apply(Q,2,max))
plot(t,Q[,1],type="n",ylab=expression(X[t]),ylim=c(r1,r2),xlab="time",las=1)
mtext(expression("Strong Taylor Scheme Order 1.5":dX[t]== a(t,X[t])*dt+sigma(t,X[t])*dW[t]),line=3,cex=1.2,adj=0.5)
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="blue")
legend("topleft",bg="gray85",border="gray",c("Average trajectory"),lty=c(1),col=c("blue"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "STS.xlsx", sheetName="Sheet 1", formatTemplate=NULL,
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
return(invisible(Result))
    }

.STSGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Strong Ito-Taylor Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
M  <- tclVar(10)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(1)
Dt <- tclVar(0.001)
drift <- tclVar("expression((0.3*x))")
sigma <- tclVar("expression((0.5*x^0.03))")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(drift)  <-"expression((   ))"
         tclvalue(sigma)  <-"expression((   ))"
         tclvalue(Output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
M.entry       <- tkentry(tt, textvariable=M,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
x0.entry      <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
drift.entry   <- tkentry(tt, textvariable=drift,width = 30)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(drift)) return()
         if (is.expression(sigma)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         drift  <- tclvalue(drift)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
        eval(substitute(.STS(N=N,M=M,t0=t0,T=T,x0=x0,Dt=Dt,a=eval(e1),sigma=eval(e2),Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=11,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=11,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.StstGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="Stochastic Process The Student Distribution ?",command=function(){print(help("Stst"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N <- tclVar(1000)
T <- tclVar(1)
t0 <- tclVar(0)
n  <- tclVar(2)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(n)      <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
n.entry   <- tkentry(tt, textvariable=n,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         n      <- as.numeric(tclObj(n))  
         output <- as.character(tclObj(output))
        eval(substitute(Stst(N=N,t0=t0,T=T,n=n,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Degrees of freedom (> 0,non-integer).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Degrees of freedom : "), n.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=7,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=7,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.WNGGUI <-
function()
         {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
        columnspan = 3,row=1)
but <- tkbutton(tt,text="White Noise Gaussian ?",command=function(){print(help("WNG"))},width=40)
tkgrid(but,row=2,columnspan = 3)

N  <- tclVar(1000)
T  <- tclVar(1)
t0 <- tclVar(0)
m  <- tclVar(0)
sigma2 <- tclVar(1)
output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(T)      <-""
         tclvalue(t0)     <-""
         tclvalue(m)      <-""
         tclvalue(sigma2) <-""
         tclvalue(output) <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
m.entry       <- tkentry(tt, textvariable=m,width = 30)
sigma2.entry  <- tkentry(tt, textvariable=sigma2,width = 30)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         m      <- as.numeric(tclObj(m))
         sigma2 <- as.numeric(tclObj(sigma2))  
         output <- as.character(tclObj(output))
        eval(substitute(WNG(N=N,t0=t0,T=T,m=m,sigma2=sigma2,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example m = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mean : "), m.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example var = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Variance : "), sigma2.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel 2007 : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = output),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = output),row=8,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.YourPlotGUI <-
function()
          {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Plot Your Data", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
        columnspan = 2,row=1)
DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("plot")))
tkgrid(DimHlp.but,row=1,column=2,sticky="w")
data(DATA1)
data(DATA2)
data(DATA3)
Data <- tclVar("DATA3")
delta <- tclVar(0.1)
Start <- tclVar(0)
Ylab <- tclVar("X(t)")
Xlab <- tclVar("Time")
Main <- tclVar("")
delta <- tclVar(0.1)
Pch <- tclVar(20)
Lty <- tclVar(1)
Lwd <- tclVar(1)
Cex <- tclVar(0)
cole <- tclVar("navy")
Type <- tclVar("l")
Grid <- tclVar("FALSE")
LogX <- tclVar("0")
LogY <- tclVar("0")
Las  <- tclVar("1")
reset <- function()
        {
         tclvalue(Data)     <-""
         tclvalue(delta)    <-""
         tclvalue(Start)    <-"0"
         tclvalue(Ylab)     <-""
         tclvalue(Xlab)     <-""
         tclvalue(Main)     <-""
         tclvalue(Pch)      <-"20"
         tclvalue(Lty)      <-"1"
         tclvalue(Lwd)      <-"1"
         tclvalue(Cex)      <-"0"
         tclvalue(cole)     <-"red"
         tclvalue(Type)     <-"l"
         tclvalue(Grid)     <-"FALSE"
         tclvalue(LogX)     <-"0"
         tclvalue(LogY)     <-"0"
         tclvalue(Las)      <-"1"
         }
tkentry         <- ttkentry
Data.entry      <- tkentry(tt, textvariable=Data,width = 30)
delta.entry     <- tkentry(tt, textvariable=delta,width = 30)
Start.entry     <- tkentry(tt, textvariable=Start,width = 30)
Ylab.entry      <- tkentry(tt, textvariable=Ylab,width = 30)
Xlab.entry      <- tkentry(tt, textvariable=Xlab,width = 30)
Main.entry      <- tkentry(tt, textvariable=Main,width = 30)
Pch.entry       <- tkentry(tt, textvariable=Pch,width = 27)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole,width = 27)
Type.entry      <- tkentry(tt, textvariable=Type,width = 30)
Grid.entry      <- tkentry(tt, textvariable=Grid)
LogX.entry      <- tkentry(tt, textvariable=LogX)
LogY.entry      <- tkentry(tt, textvariable=LogY)
USTHB <- function(...) 
        {
         if (is.null(Data)) return()
         Data      <- as.character(tclObj(Data))  
         delta     <- as.numeric(tclObj(delta))
         Start     <- as.numeric(tclObj(Start))
         Ylab      <- as.character(tclObj(Ylab)) 
         Xlab      <- as.character(tclObj(Xlab)) 
         Main      <- as.character(tclObj(Main)) 
         Pch       <- as.numeric(tclObj(Pch))
         Lty       <- as.numeric(tclObj(Lty)) 
         Lwd       <- as.numeric(tclObj(Lwd)) 
         Cex       <- as.numeric(tclObj(Cex))
         Las       <- as.numeric(tclObj(Las))
         cole      <- as.character(tclObj(cole))
         Type      <- as.character(tclObj(Type))
         Grid      <- as.character(tclObj(Grid))
         LogX      <- as.numeric(tclObj(LogX))
         LogY      <- as.numeric(tclObj(LogY))
         e1        <- try(parse(text=Data)) 
         eval(substitute(.YourPlot(Data=eval(e1),delta=delta,Start=Start,Xlab=Xlab,Ylab=Ylab,
              Main=Main,Pch=Pch,Lty=Lty,Lwd=Lwd,Cex=Cex,cole=cole
              ,Type=Type,Grid=Grid,LogX=LogX,LogY=LogY,Las=Las)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA3)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), Data.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The time of the first observation. Either a single number or a vector of two integers, which specify a natural time unit and a (1-based) number of samples into the time unit. See the examples for the use of the second form.(Example Start = 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Start : "), Start.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Xlab = Time.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Xlab : "), Xlab.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Ylab = X(t).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Ylab : "), Ylab.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Title = Bessel Process.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Title : "), Main.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() print(.pchShow()))
tkgrid(tklabel(tt,text="Points symbols : "),Pch.entry,sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=8, column=1, sticky="e")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Colors : "), cole.entry,sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=27)
tkgrid(COLE.comboBox, row=9, column=1,sticky="e")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Line width : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=10, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=F, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=10, column=1,sticky="e")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=11, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=F, variable=Cex,
                   resolution=0.1, orient="horizontal")
tkgrid(slider1,row=11, column=1,sticky="e")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Grid : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Grid),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Grid),row=12,column=1)
 

tkgrid(tklabel(tt,text = "Logarithmic Axis : "),sticky = "w")
tkgrid(tkcheckbutton(tt,text=" X",variable = LogX),row=13,columnspan = 2)
tkgrid(tkcheckbutton(tt,text="  Y",variable = LogY),row=13,column = 1)


frame1 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame1, text = "Line type : "), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "blank", value = 0, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "solid", value = 1, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dashed", value = 2, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotted", value = 3, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotdash", value = 4, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "longdash", value = 5, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "twodash", value = 6, variable = Lty), 
        sticky = "w")
tkgrid(frame1, rowspan = 4,row=17,column=0, sticky = "n",padx=5,pady=5)

frame2 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame2, text = "Type : "), sticky = "n")
tkgrid(tkradiobutton(frame2, text = "points", value = "p", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "lines", value = "l", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "both", value =" b", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "overplotted", value = "o", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "histogram", value = "h", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "stair steps", value = "s", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "no plotting", value = "n", variable = Type), 
        sticky = "w")
tkgrid(frame2, rowspan = 4,row=17, sticky = "n",columnspan=2,padx=5,pady=5)

frame3 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame3, text = "Style of axis labels : "), sticky = "n")
tkgrid(tkradiobutton(frame3, text = "always parallel \nto the axis", value = "0", 
        variable = Las), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "always horizontal", value = "1", variable = Las), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "always perpendicular \nto the axis", value =" 2", 
        variable = Las), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "always vertical", value = "3", variable = Las), 
        sticky = "w")
tkgrid(frame3, rowspan = 4,row=17, sticky = "e",columnspan=4,padx=5,pady=5)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Plotting",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.YourPlot <-
function(Data,delta,Start=0,Xlab,Ylab,Main,Pch=1,
                     Cex=1,Lty=1,Lwd=1,Las,cole="red",LogX=0,LogY=0,
                     Type,Grid=FALSE)
          {
if (length(dim(Data)) > 0) 
        stop("Error Data must be numeric vector")
if (delta <= 0 )
        stop("Error Delta > 0")
Data <- ts(Data,deltat=delta,start = Start )
if ( LogX == 0 & LogY == 0) {
plot(ts(Data,deltat=delta,start = Start),xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
}
if ( LogX == 1 & LogY == 1) {
plot(ts(Data,deltat=delta,start = Start),log="xy",xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
} else {if ( LogX == 1 ) {
plot(ts(Data,deltat=delta,start = Start),log="x",xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
} else {if ( LogY == 1 ) {
plot(ts(Data,deltat=delta,start = Start),log="y",xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
}}}
if ( Grid == FALSE){
points(ts(Data,deltat=delta,start = Start),lwd=Lwd,col=cole,type=Type,lty=Lty,
      cex=Cex,pch=Pch)}
if ( Grid == TRUE) {
points(ts(Data,deltat=delta,start = Start),lwd=Lwd,col=cole,type=Type,lty=Lty,
      cex=Cex,pch=Pch,panel.frist=grid())}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),
      side = 1, line = 4, adj = 0.5, cex = .66)
}

.YourPointsGUI <-
function()
          {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Points Your Data", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
        columnspan = 2,row=1)
DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("points")))
tkgrid(DimHlp.but,row=1,column=2,sticky="w")
data(DATA1)
data(DATA2)
data(DATA3)
Data <- tclVar("DATA3")
delta <- tclVar(0.1)
Start <- tclVar(0)
Pch <- tclVar(20)
Lty <- tclVar(1)
Lwd <- tclVar(1)
Cex <- tclVar(0)
cole <- tclVar("navy")
Type <- tclVar("l")
reset <- function()
        {
         tclvalue(Data)     <-""
         tclvalue(delta)    <-""
         tclvalue(Start)    <-"0"
         tclvalue(Pch)      <-"20"
         tclvalue(Lty)      <-"1"
         tclvalue(Lwd)      <-"1"
         tclvalue(Cex)      <-"0"
         tclvalue(cole)     <-"red"
         tclvalue(Type)     <-"l"
         }
tkentry         <- ttkentry
Data.entry      <- tkentry(tt, textvariable=Data,width = 30)
delta.entry     <- tkentry(tt, textvariable=delta,width = 30)
Start.entry     <- tkentry(tt, textvariable=Start,width = 30)
Pch.entry       <- tkentry(tt, textvariable=Pch,width = 27)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole,width = 27)
Type.entry      <- tkentry(tt, textvariable=Type,width = 30)
USTHB <- function(...) 
        {
         if (is.null(Data)) return()
         Data      <- as.character(tclObj(Data))  
         delta     <- as.numeric(tclObj(delta))
         Start     <- as.numeric(tclObj(Start))
         Pch       <- as.numeric(tclObj(Pch))
         Lty       <- as.numeric(tclObj(Lty)) 
         Lwd       <- as.numeric(tclObj(Lwd)) 
         Cex       <- as.numeric(tclObj(Cex))
         cole      <- as.character(tclObj(cole))
         Type      <- as.character(tclObj(Type))
         e1        <- try(parse(text=Data)) 
         eval(substitute(.YourPoints(Data=eval(e1),delta=delta,Start=Start,
              Pch=Pch,Lty=Lty,Lwd=Lwd,Cex=Cex,cole=cole,Type=Type)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector of the observed time-series values).(Example names = DATA3)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), Data.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The fraction of the sampling period between successive observations.(Dt = (T-t0)/N, Example Dt = 0.1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), delta.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The time of the first observation. Either a single number or a vector of two integers, which specify a natural time unit and a (1-based) number of samples into the time unit. See the examples for the use of the second form.(Example Start = 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Start : "), Start.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() print(.pchShow()))
tkgrid(tklabel(tt,text="Pch : "),Pch.entry,sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=5, column=1, sticky="e")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Color : "), cole.entry,sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=27)
tkgrid(COLE.comboBox, row=6, column=1,sticky="e")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Lwd Value : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=7, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=F, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=7, column=1,sticky="e")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=8, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=F, variable=Cex,
                   resolution=0.1, orient="horizontal")
tkgrid(slider1,row=8, column=1,sticky="e")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")




frame1 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame1, text = "Lty : "), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "blank", value = 0, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "solid", value = 1, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dashed", value = 2, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotted", value = 3, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotdash", value = 4, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "longdash", value = 5, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "twodash", value = 6, variable = Lty), 
        sticky = "w")
tkgrid(frame1, rowspan = 4,row=9,column=0, sticky = "n",padx=5,pady=5)

frame2 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame2, text = "Type : "), sticky = "n")
tkgrid(tkradiobutton(frame2, text = "points", value = "p", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "lines", value = "l", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "both", value =" b", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "overplotted", value = "o", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "histogram", value = "h", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "stair steps", value = "s", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "no plotting", value = "n", variable = Type), 
        sticky = "w")
tkgrid(frame2, rowspan = 4,row=10, sticky = "n",columnspan=2,padx=5,pady=5)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Add Your Data",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.YourPoints <-
function(Data,delta,Start=0,Pch=1,Lty=1,Lwd=2,cole="red",Type="l",Cex=1)
            {
if (length(dim(Data)) > 0) 
        stop("Error Data must be numeric vector")
if (delta <= 0 )
        stop("Error Delta > 0")

points(ts(Data,deltat=delta,start=Start),lwd=Lwd,cex=Cex,col=cole,type=Type,lty=Lty,pch=Pch)
}

.YourSolution <-
function(Sol,Start,End,dt,Xlab,Ylab,Main,Pch=1,
                     Cex=1,Lty=1,Lwd=1,cole="red",LogX=0,LogY=0,
                     Type="l",Grid=FALSE,Las)
              {
if (!is.expression(Sol)) stop("The Solution must be expressions f(t,w)")

A <- function(t, w) eval(Sol)


k1 <- End
k2 <- Start

N = (k1 - k2)/dt
t = seq(Start, End, length = N + 1)
u = runif(N, 0, 1)
for (i in 1:length(u)) {
            if (u[i] >= 0.5) 
                u[i] = +1
            else u[i] = -1
        }
w = cumsum(c(0, u)) * sqrt(dt) 
X <- numeric()
for (i in 1:(N+1)){
X[i] = A(t[i],w[i])
}
if ( LogX == 0 & LogY == 0) {
plot(t,X,xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
}
if ( LogX == 1 & LogY == 1) {
plot(t,eval(Sol),log="xy",xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
} else {if ( LogX == 1 ) {
plot(t,eval(Sol),log="x",xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
} else {if ( LogY == 1 ) {
plot(t,eval(Sol),log="y",xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
}}}
if ( Grid == FALSE){
points(t,eval(Sol),lwd=Lwd,col=cole,type=Type,lty=Lty,
      cex=Cex,pch=Pch)}
if ( Grid == TRUE) {
points(t,eval(Sol),lwd=Lwd,col=cole,type=Type,lty=Lty,
      cex=Cex,pch=Pch,panel.frist=grid())}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),
      side = 1, line = 4, adj = 0.5, cex = .66)
}

.YourSolutionGUI <-
function()
          {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Plot Your Solution", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
        columnspan = 2,row=1)
DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("plot")))
tkgrid(DimHlp.but,row=1,column=2,sticky="w")

Sol <- tclVar("expression(10*exp((2-0.5*4)*t+2*w))")
Start <- tclVar(0)
End <- tclVar(1)
dt <- tclVar(0.001)
Ylab <- tclVar("X(t)")
Xlab <- tclVar("Time")
Main <- tclVar("")
Pch <- tclVar(20)
Lty <- tclVar(1)
Lwd <- tclVar(1)
Cex <- tclVar(0)
cole <- tclVar("navy")
Type <- tclVar("l")
Grid <- tclVar("FALSE")
LogX <- tclVar("0")
LogY <- tclVar("0")
Las <- tclVar("1")
reset <- function()
        {
         tclvalue(Sol)      <-"expression(    )"
         tclvalue(dt)       <-""
         tclvalue(Start)    <-"0"
         tclvalue(End)      <-""
         tclvalue(Ylab)     <-""
         tclvalue(Xlab)     <-""
         tclvalue(Main)     <-""
         tclvalue(Pch)      <-"20"
         tclvalue(Las)      <-"1"
         tclvalue(Lty)      <-"1"
         tclvalue(Lwd)      <-"1"
         tclvalue(Cex)      <-"0"
         tclvalue(cole)     <-"red"
         tclvalue(Type)     <-"l"
         tclvalue(Grid)     <-"FALSE"
         tclvalue(LogX)     <-"0"
         tclvalue(LogY)     <-"0"
         }
tkentry         <- ttkentry
Sol.entry       <- tkentry(tt, textvariable=Sol,width = 30)
dt.entry        <- tkentry(tt, textvariable=dt,width = 30)
Start.entry     <- tkentry(tt, textvariable=Start,width = 30)
End.entry       <- tkentry(tt, textvariable=End,width = 30)
Ylab.entry      <- tkentry(tt, textvariable=Ylab,width = 30)
Xlab.entry      <- tkentry(tt, textvariable=Xlab,width = 30)
Main.entry      <- tkentry(tt, textvariable=Main,width = 30)
Pch.entry       <- tkentry(tt, textvariable=Pch,width = 27)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole,width = 27)
Type.entry      <- tkentry(tt, textvariable=Type,width = 30)
Grid.entry      <- tkentry(tt, textvariable=Grid)
LogX.entry      <- tkentry(tt, textvariable=LogX)
LogY.entry      <- tkentry(tt, textvariable=LogY)
USTHB <- function(...) 
        {
         Sol       <- tclvalue(Sol) 
         dt        <- as.numeric(tclObj(dt))
         Start     <- as.numeric(tclObj(Start))
         End       <- as.numeric(tclObj(End))
         Ylab      <- as.character(tclObj(Ylab)) 
         Xlab      <- as.character(tclObj(Xlab)) 
         Main      <- as.character(tclObj(Main)) 
         Pch       <- as.numeric(tclObj(Pch))
         Lty       <- as.numeric(tclObj(Lty)) 
         Lwd       <- as.numeric(tclObj(Lwd)) 
         Cex       <- as.numeric(tclObj(Cex))
         cole      <- as.character(tclObj(cole))
         Type      <- as.character(tclObj(Type))
         Grid      <- as.character(tclObj(Grid))
         LogX      <- as.numeric(tclObj(LogX))
         LogY      <- as.numeric(tclObj(LogY))
         Las       <- as.numeric(tclObj(Las))
         e1        <- try(parse(text=Sol))
         eval(substitute(.YourSolution(Sol=eval(e1),dt=dt,Start=Start,End=End,Xlab=Xlab,Ylab=Ylab,
              Main=Main,Pch=Pch,Lty=Lty,Lwd=Lwd,Cex=Cex,cole=cole
              ,Type=Type,Grid=Grid,LogX=LogX,LogY=LogY,Las=Las)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and w. \nExample : expression(10*exp((2-0.5*4)*t+2*w)) \nt is time. \nw is Winner Process.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Your Solution : "), Sol.entry,sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example :  Start = 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Start : "), Start.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example : End = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="End : "), End.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example : Deltat = 0.01).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), dt.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Xlab = Time.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Xlab : "), Xlab.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Ylab = X(t).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Ylab : "), Ylab.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Title = Bessel Process.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Title : "), Main.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() print(.pchShow()))
tkgrid(tklabel(tt,text="Points symbols : "),Pch.entry,sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=9, column=1, sticky="e")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Colors : "), cole.entry,sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=27)
tkgrid(COLE.comboBox, row=10, column=1,sticky="e")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Line width : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=11, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=F, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=11, column=1,sticky="e")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=12, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=F, variable=Cex,
                   resolution=0.1, orient="horizontal")
tkgrid(slider1,row=12, column=1,sticky="e")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Grid : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Grid),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Grid),row=13,column=1)
 

tkgrid(tklabel(tt,text = "Logarithmic Axis :"),sticky = "w")
tkgrid(tkcheckbutton(tt,text=" X",variable = LogX),row=14,columnspan = 2)
tkgrid(tkcheckbutton(tt,text="  Y",variable = LogY),row=14,column = 1)


frame1 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame1, text = "Line type : "), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "blank", value = 0, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "solid", value = 1, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dashed", value = 2, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotted", value = 3, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotdash", value = 4, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "longdash", value = 5, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "twodash", value = 6, variable = Lty), 
        sticky = "w")
tkgrid(frame1, rowspan = 4,row=16,column=0, sticky = "n",padx=5,pady=5)

frame2 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame2, text = "Type : "), sticky = "n")
tkgrid(tkradiobutton(frame2, text = "points", value = "p", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "lines", value = "l", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "both", value =" b", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "overplotted", value = "o", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "histogram", value = "h", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "stair steps", value = "s", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "no plotting", value = "n", variable = Type), 
        sticky = "w")
tkgrid(frame2, rowspan = 4,row=16, sticky = "n",columnspan=2,padx=5,pady=5)

frame3 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame3, text = "Style of axis labels : "), sticky = "n")
tkgrid(tkradiobutton(frame3, text = "always parallel \nto the axis", value = "0", 
        variable = Las), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "always horizontal", value = "1", variable = Las), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "always perpendicular \nto the axis", value =" 2", 
        variable = Las), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "always vertical", value = "3", variable = Las), 
        sticky = "w")
tkgrid(frame3, rowspan = 4,row=16, sticky = "e",columnspan=4,padx=5,pady=5)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Plotting",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AddSolutionGUI <-
function()
          {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
tkwm.title(tt, "Sim.DiffProc")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
tkgrid(tklabel(tt, text = "Points Your Solution", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
        columnspan = 2,row=1)
DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("points")))
tkgrid(DimHlp.but,row=1,column=2,sticky="w")
Sol <- tclVar("expression(10*exp((2-0.5*4)*t+2*w))")
Start <- tclVar(0)
End <- tclVar(1)
dt <- tclVar(0.001)
Pch <- tclVar(20)
Lty <- tclVar(1)
Lwd <- tclVar(1)
Cex <- tclVar(0)
cole <- tclVar("navy")
Type <- tclVar("l")
reset <- function()
        {
         tclvalue(Sol)      <-"expression(    )"
         tclvalue(dt)       <-""
         tclvalue(Start)    <-"0"
         tclvalue(End)      <-""
         tclvalue(Pch)      <-"20"
         tclvalue(Lty)      <-"1"
         tclvalue(Lwd)      <-"1"
         tclvalue(Cex)      <-"0"
         tclvalue(cole)     <-"red"
         tclvalue(Type)     <-"l"
         }
tkentry         <- ttkentry
Sol.entry       <- tkentry(tt, textvariable=Sol,width = 30)
dt.entry        <- tkentry(tt, textvariable=dt,width = 30)
Start.entry     <- tkentry(tt, textvariable=Start,width = 30)
End.entry       <- tkentry(tt, textvariable=End,width = 30)
Pch.entry       <- tkentry(tt, textvariable=Pch,width = 27)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole,width = 27)
Type.entry      <- tkentry(tt, textvariable=Type,width = 30)
USTHB <- function(...) 
        {
         Sol       <- tclvalue(Sol) 
         dt        <- as.numeric(tclObj(dt))
         Start     <- as.numeric(tclObj(Start))
         End       <- as.numeric(tclObj(End))
         Pch       <- as.numeric(tclObj(Pch))
         Lty       <- as.numeric(tclObj(Lty)) 
         Lwd       <- as.numeric(tclObj(Lwd)) 
         Cex       <- as.numeric(tclObj(Cex))
         cole      <- as.character(tclObj(cole))
         Type      <- as.character(tclObj(Type))
         e1        <- try(parse(text=Sol)) 
         eval(substitute(.AddSolution(Sol=eval(e1),dt=dt,Start=Start,End=End,
              Pch=Pch,Lty=Lty,Lwd=Lwd,Cex=Cex,cole=cole,Type=Type)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and w. \nExample : expression(10*exp((2-0.5*4)*t+2*w)) \nt is time. \nw is Winner Process.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Your Solution : "), Sol.entry,sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example :  Start = 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Start : "), Start.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example : End = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="End : "), End.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example : Deltat = 0.01).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), dt.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() print(.pchShow()))
tkgrid(tklabel(tt,text="Points symbols : "),Pch.entry,sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=6, column=1, sticky="e")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Colors : "), cole.entry,sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=27)
tkgrid(COLE.comboBox, row=7, column=1,sticky="e")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Line width : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=8, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=F, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=8, column=1,sticky="e")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=9, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=F, variable=Cex,
                   resolution=0.1, orient="horizontal")
tkgrid(slider1,row=9, column=1,sticky="e")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")




frame1 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame1, text = "Line type : "), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "blank", value = 0, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "solid", value = 1, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dashed", value = 2, 
        variable = Lty), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotted", value = 3, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "dotdash", value = 4, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "longdash", value = 5, variable = Lty), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "twodash", value = 6, variable = Lty), 
        sticky = "w")
tkgrid(frame1, rowspan = 4,row=11,column=0, sticky = "ew",padx=5,pady=5)

frame2 <- tkframe(tt, relief = "groove", borderwidth = 4)
tkgrid(tklabel(frame2, text = "Type : "), sticky = "n")
tkgrid(tkradiobutton(frame2, text = "points", value = "p", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "lines", value = "l", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "both", value =" b", 
        variable = Type), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "overplotted", value = "o", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "histogram", value = "h", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "stair steps", value = "s", variable = Type), 
        sticky = "w")
tkgrid(tkradiobutton(frame2, text = "no plotting", value = "n", variable = Type), 
        sticky = "w")
tkgrid(frame2, rowspan = 4,row=11, sticky = "ew",column=1,padx=5,pady=5)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Add Your Solution",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AddSolution <-
function(Sol,Start,End,dt,Pch=1,
                     Cex=1,Lty=1,Lwd=1,cole="red",Type="l")
              {
if (!is.expression(Sol)) stop("The Solution must be expressions f(t,w)")

A <- function(t, w) eval(Sol)


k1 <- End
k2 <- Start

N = (k1 - k2)/dt
t = seq(Start, End, length = N + 1)
u = runif(N, 0, 1)
for (i in 1:length(u)) {
            if (u[i] >= 0.5) 
                u[i] = +1
            else u[i] = -1
        }
w = cumsum(c(0, u)) * sqrt(dt) 
X <- numeric()
for (i in 1:(N+1)){
X[i] = A(t[i],w[i])
}
points(t,eval(Sol),lwd=Lwd,cex=Cex,col=cole,type=Type,lty=Lty,pch=Pch)
}

.RSNSSDE <-
function()
          {
local({
    have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
    if(have_ttk) {
        tkbutton <- ttkbutton
        tkcheckbutton <- ttkcheckbutton
        tkentry <- ttkentry
        tkframe <- ttkframe
        tklabel <- ttklabel
        tkradiobutton <- ttkradiobutton
    }
tt <- tktoplevel()
topMenu <- tkmenu(tt)
tkwm.title(tt,"Sim.DiffProc~~Simulation of Diffusion Processes(1.0-Wed Jan 05 11:52:51 2011)")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(Sys.getenv("R_HOME"), "bin","R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
rm(Rico)
tkwm.deiconify(tt)
tkconfigure(tt,menu=topMenu)
tkfocus(tt)
icnfnameR <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"img"),
             "/", "usthb.GIF", sep="")
icn <- tkimage.create("photo", file=icnfnameR)
Rlabel <- tklabel(tt, image=icn)
tkgrid(Rlabel, padx=0, sticky = "ne",columnspan=2,row=0)
xscr <- ttkscrollbar(tt, orient="horizontal",
command=function(...) tkxview(txt, ...))
yscr <- ttkscrollbar(tt,
command=function(...) tkyview(txt, ...))
txt <- tktext(tt,width=88,height=16, bg="white",wrap="none", undo=TRUE,yscrollcommand = function(...) tkset(xscr, 
        ...))
tkconfigure(txt, xscrollcommand=function(...) tkset(xscr, ...))
tkconfigure(txt, yscrollcommand=function(...) tkset(yscr, ...))

###############################################################################
###############################################################################

##frame0 <- tkframe(tt, relief = "groove", borderwidth = 3)
##icnfname1 <- paste(file.path(.path.package(package="SNSSDE")[1],"img"),
##             "/", "1.GIF", sep="")
##icnfname2 <- paste(file.path(.path.package(package="SNSSDE")[1],"img"),
##             "/", "2.GIF", sep="")
##icnfname3 <- paste(file.path(.path.package(package="SNSSDE")[1],"img"),
##             "/", "3.GIF", sep="")
##icnfname4 <- paste(file.path(.path.package(package="SNSSDE")[1],"img"),
##             "/", "4.GIF", sep="")
##icnfname5 <- paste(file.path(.path.package(package="SNSSDE")[1],"img"),
##             "/", "5.GIF", sep="")
##icn1 <- tkimage.create("photo", file=icnfname1)
##icn2 <- tkimage.create("photo", file=icnfname2)
##icn3 <- tkimage.create("photo", file=icnfname3)
##icn4 <- tkimage.create("photo", file=icnfname4)
##icn5 <- tkimage.create("photo", file=icnfname5)
##tkgrid(tkbutton(frame0, image=icn1,command=function(){openFile()}), padx=0.5,pady=0.5, sticky = "nw",row=0)
##tkgrid(tkbutton(frame0, image=icn2,command=function(){setWd()}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=1)
##tkgrid(tkbutton(frame0, image=icn3,command=function(){Save()}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=2)
##tkgrid(tkbutton(frame0, image=icn4,command=function(){
##                                              focused <- tkfocus()
##                                              tcl(focused, "edit", "undo")
##                                                 }), padx=0.5,pady=0.5, sticky = "nw",row=0,column=3)
##tkgrid(tkbutton(frame0, image=icn5,command=function(){
##                                                      focused <- tkfocus()
##                                              tcl(focused, "edit", "redo")
## }), padx=0.5,pady=0.5, sticky = "nw",row=0,column=4)
##tkgrid(frame0,row=0, sticky = "nw",padx=5,pady=5)


frame <- tkframe(tt)##, relief = "groove")##, borderwidth = 5)
tkgrid(tkbutton(frame,text="Plot Your Data",command=function(){.YourPlotGUI()},width=17),column=1,row=0)
tkgrid(tkbutton(frame,text="Add Your Data",command=function(){.YourPointsGUI()},width=17),column=1,row=1)
tkgrid(tkbutton(frame,text="Save Graphic",command=function(){.outgraph()},width=17),column=2,row=2)
tkgrid(tkbutton(frame,text="Choose Your Data",command=function(){.choosdata()},width=17),column=1,row=2)
tkgrid(tkbutton(frame,text="Plot Your Solution",command=function(){.YourSolutionGUI()},width=17),column=2,row=0)
tkgrid(tkbutton(frame,text="Add Your Solution",command=function(){.AddSolutionGUI()},width=17),column=2,row=1)

tkgrid(frame,row=0, sticky = "wn",column=1,padx=5,pady=5)

tkgrid(tklabel(tt, text=gettext("R-Sim.DiffProc Console"), foreground="blue"),row=0,sticky="w")
tkgrid(txt, yscr, sticky="news", columnspan=2,row=1)
tkgrid(xscr,columnspan=2)
tkgrid.configure(yscr, sticky="ns")
tkgrid.configure(xscr, sticky="ew")
tkfocus(txt)

###############################################################################
################################### File ######################################
exit <-
function(){
    exitValue <- tkmessageBox(message="Are you sure you want to exit Sim.DiffProc ?",
      icon="question",
      type="okcancel",
      default="cancel")
    if(tclvalue(exitValue) == "ok"){
      tkdestroy(tt)
   }
  }
  
evalGUI <-
function() 
{
selection <- strsplit(tclvalue(tkget(txt,"0.0","end")), " ")[[1]]
if (is.na(selection[1])) {
tktag.add(txt, "currentLine", "insert linestart", "insert lineend")
selection <- strsplit(tclvalue(tktag.ranges(txt,"currentLine")), " ")[[1]]
tktag.delete(txt, "currentLine")
if (is.na(selection[1])) {
tkmessageBox(message=gettext("Nothing is selected."),
type="error")
tkfocus(txt)
return()
}
}
  e <- try(parse(text=selection))
  if (inherits(e, "try-error")) {
    tkmessageBox(message="Syntax error",
                 icon="error")
    return()
   }
tkinsert(txt,"end",paste("\n ", eval(e),"\n", sep=""))
tktag.add(txt, "currentLine", "end - 2 lines linestart", "end - 2 lines lineend")
tktag.configure(txt, "currentLine", foreground="red")
}

Save <-
function() 
        {
  text <- tclvalue(tkget(get("txt"), "@0,0", "end"))
  fname <- tclvalue(tkgetSaveFile(filetypes = "{{Text Files} {.txt}} {{All files} *}"))
  if (fname != "") {
  f <- file(fname)
  writeLines(text, con = f)
  close(f)
            }
        }
  
fileMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="File",menu=fileMenu)
tkadd(fileMenu,"command",label="Open file",command=function() {.openFile()})
tkadd(fileMenu,"command",label="Change working directory",command=function(){.setWd()})
tkadd(fileMenu,"separator")
tkadd(fileMenu,"command",label="Import data from...",command=function(){.importDataGUI()})
tkadd(fileMenu,"command",label="Save                           Ctrl+S",command=function(){Save()})
tkadd(fileMenu,"command",label="Save graphic             Ctrl+G",command=function() {.outgraph()})
tkadd(fileMenu,"separator")
Quit <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Quit,"command",label="Quit Sim.DiffProc",command=function() exit())
tkadd(Quit,"command",label="Quit R",command=function() q())
tkadd(fileMenu,"cascade",label="Quit",menu=Quit)
tkbind(tt, "<Control-s>",Save)
tkbind(tt, "<Control-S>",Save)
tkbind(tt, "<Control-g>",.outgraph)
tkbind(tt, "<Control-G>",.outgraph)
###############################################################################
#############################    Edit       ###################################

onCopy <- function(){
focused <- tkfocus()
selection <- strsplit(tclvalue(tktag.ranges(focused, "sel")), " ")[[1]]
if (is.na(selection[1])) return()
text <- tclvalue(tkget(focused, selection[1], selection[2]))
tkclipboard.clear()
tkclipboard.append(text)
}

onDelete <- function(){
focused <- tkfocus()
selection <- strsplit(tclvalue(tktag.ranges(focused, "sel")), " ")[[1]]
if (is.na(selection[1])) return()
tkdelete(focused, selection[1], selection[2])
}

onCut <- function(){
onCopy()
onDelete()
}

onPaste <- function(){
onDelete()
focused <- tkfocus()
text <- tclvalue(.Tcl("selection get -selection CLIPBOARD"))
if (length(text) == 0) return()
tkinsert(focused, "insert", text)
}

onSelectAll <- function() {
focused <- tkfocus()
tktag.add(focused, "sel", "1.0", "end")
tkfocus(focused)
}

onUndo <- function(){
focused <- tkfocus()
tcl(focused, "edit", "undo")
}
onRedo <- function(){
focused <- tkfocus()
tcl(focused, "edit", "redo")
}
EDMenu <- tkmenu(tkmenu(txt),tearoff=FALSE)
tkadd(topMenu,"cascade",label="Edit",menu=EDMenu)
tkadd(EDMenu,"command",label="Eval Code           Ctrl+R",
     command=function() {evalGUI()})
tkadd(EDMenu,"command",label="Clear                   Ctrl+T",
     command=function(){tkdelete(txt, '@0,0', 'end' )})
tkadd(EDMenu,"separator")
tkadd(EDMenu,"command",label="Undo                   Ctrl+Z",
     command=function() {onUndo()})
tkadd(EDMenu,"command",label="Redo                    Ctrl+W",
     command=function() {onRedo()})
tkadd(EDMenu,"separator")
tkadd(EDMenu,"command",label="Cut                       Ctrl+X",
     command=function() {onCut()})
tkadd(EDMenu,"command",label="Copy                    Ctrl+C",
     command=function() {onCopy()})
tkadd(EDMenu,"command",label="Paste                    Ctrl+V",
     command=function() {onPaste()})
tkadd(EDMenu,"separator")
tkadd(EDMenu,"command",label="Select All              Ctrl+A",
     command=function() {onSelectAll()})
tkadd(EDMenu,"command",label="Delete                   Ctrl+D",
     command=function() {onDelete()})
click  <- function() {tkpopup(EDMenu, tkwinfo("pointerx", txt), tkwinfo("pointery", txt))}
tkbind(tt, "<Control-r>", evalGUI)
tkbind(tt, "<Control-R>", evalGUI)
tkbind(tt, "<Control-t>", function(){tkdelete(txt, '@0,0', 'end' )})
tkbind(tt, "<Control-T>", function(){tkdelete(txt, '@0,0', 'end' )})
tkbind(tt, "<Control-w>", onRedo)
tkbind(tt, "<Control-W>", onRedo)
tkbind(tt, "<Control-z>", onUndo)
tkbind(tt, "<Control-Z>", onUndo)
tkbind(tt, "<Control-x>", onCut)
tkbind(tt, "<Control-X>", onCut)
tkbind(tt, "<Control-c>", onCopy)
tkbind(tt, "<Control-C>", onCopy)
tkbind(tt, "<Control-v>", onPaste)
tkbind(tt, "<Control-V>", onPaste)
tkbind(tt, "<Control-a>", onSelectAll)
tkbind(tt, "<Control-A>", onSelectAll)
tkbind(tt, "<Control-d>", onDelete)
tkbind(tt, "<Control-D>", onDelete)
tkbind(txt, "<Button-3>", click)

###############################################################################
####################### Brownian Motion Model #################################

BMMMenu <- tkmenu(topMenu,tearoff=TRUE)
tkadd(topMenu,"cascade",label="Brownian Motion",menu=BMMMenu)
BMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BMMenu,"command",label="by The Normal Distribution",
      command=function() {.BMNGUI()})
tkadd(BMMenu,"command",label="by a Random Walk",
  command=function(){.BMRWGUI()} )
tkadd(BMMMenu,"cascade",label="Creating Brownian Motion",menu=BMMenu)
BMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BMMenu,"command",label="by The Normal Distribution",
      command=function() {.BMNFGUI()})
tkadd(BMMenu,"command",label="by a Random Walk",
 command=function(){.BMRWFGUI()} )
tkadd(BMMMenu,"cascade",label="Creating Flow of Brownian Motion",menu=BMMenu)
BMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BMMenu,"command",label="Arithmetic Brownian",
      command=function() {.ABMGUI()})
tkadd(BMMenu,"command",label="Flow of Arithmetic Brownian",
 command=function(){.ABMFGUI()} )
tkadd(BMMMenu,"cascade",label="Creating Arithmetic Brownian Motion",menu=BMMenu)
BMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BMMenu,"command",label="Geometric Brownian",
      command=function() {.GBMGUI()})
tkadd(BMMenu,"command",label="Flow of Geometric Brownian",
 command=function(){.GBMFGUI()} )
tkadd(BMMMenu,"cascade",label="Creating Geometric Brownian Motion",menu=BMMenu)
BMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BMMenu,"command",label="Brownian Bridge",
     command=function() {.BBGUI()})
tkadd(BMMenu,"command",label="Flow of Brownian Bridge",
 command=function(){.BBFGUI()} )
tkadd(BMMMenu,"cascade",label="Creating Brownian Bridge",menu=BMMenu)
BMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BMMenu,"command",label="Empirical Covariance for Brownian Motion",
     command=function() {.BMcovGUI()})
tkadd(BMMenu,"command",label="Limit for Brownian Motion",
 command=function(){.BMinfGUI()} )
tkadd(BMMenu,"command",label="Invariance by Reversal of Time",
 command=function(){.BMIrtGUI()} )
tkadd(BMMenu,"command",label="Invariance by scaling",
 command=function(){.BMscalGUI()} )
tkadd(BMMenu,"command",label="Trajectories brownian lies between the two curves",
 command=function(){.BMPGUI()} )
tkadd(BMMMenu,"cascade",label="Brownian Motion Property",menu=BMMenu)

###############################################################################
#############################  Stochastic Integral ############################

STMenu <- tkmenu(topMenu,tearoff=TRUE)
tkadd(topMenu,"cascade",label="Stochastic Integral",menu=STMenu)
Stra <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Stra,"command",label="Simulation of the Stratonovitch integral(W(s) o dW(s),0,t)",
       command=function() {.BMStraGUI()})
tkadd(Stra,"command",label="Simulation of the Stratonovitch integral(alpha o dW(s),0,t)",
       command=function() {.BMStraCGUI()})
tkadd(Stra,"command",label="Simulation of the Stratonovitch integral(W(s)^n o dW(s),0,t)",
       command=function() {.BMStraPGUI()})
tkadd(Stra,"command",label="Simulation of the Stratonovitch integral(s o dW(s),0,t)",
       command=function() {.BMStraTGUI()})
tkadd(STMenu,"cascade",label="Stratonovitch Integral",menu=Stra)
Ito <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Ito,"command",label="Simulation of the Ito integral(W(s)dW(s),0,t)",
       command=function() {.BMIto2GUI()})
tkadd(Ito,"command",label="Simulation of the Ito integral(alpha*dW(s),0,t)",
       command=function() {.BMItoCGUI()})
tkadd(Ito,"command",label="Simulation of the Ito integral(W(s)^n*dW(s),0,t)",
       command=function() {.BMItoPGUI()})
tkadd(Ito,"command",label="Simulation of the Ito integral(s*dW(s),0,t)",
       command=function() {.BMItoTGUI()})
tkadd(STMenu,"cascade",label="Ito Integral",menu=Ito)
ItovsStra <- tkmenu(topMenu,tearoff=FALSE)
tkadd(ItovsStra,"command",label="Integral(W(s)dW(s),0,t) vs Integral(W(s) o dW(s),0,t)",
       command=function() {.ItovsStraGUI()})
tkadd(ItovsStra,"command",label="Integral(s*dW(s),0,t) vs Integral(s o dW(s),0,t)",
       command=function() {.ItovsStraTGUI()})
tkadd(ItovsStra,"command",label="Integral(W(s)^n*dW(s),0,t) vs Integral(W(s)^n o dW(s),0,t)",
       command=function() {.ItovsStraPGUI()})
tkadd(STMenu,"cascade",label="Ito Integral vs Stratonovitch Integral",menu=ItovsStra)

###############################################################################
############################ Simulation for Stochastic Models #################

SMMenu <- tkmenu(topMenu,tearoff=TRUE)
tkadd(topMenu,"cascade",label="Stochastic Models",menu=SMMenu)
tkadd(SMMenu,"command",label="Bessel Process",
     command=function() {.BesselpGUI()})
tkadd(SMMenu,"command",label="Constant Elasticity of Variance (CEV) Model",
     command=function() {.CEVGUI()})
CIRMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(CIRMenu,"command",label="CIR Model",
     command=function() {.CIRGUI()})
tkadd(CIRMenu,"command",label="The Modified CIR and hyperbolic Process",
     command=function() {.CIRhyGUI()})
tkadd(SMMenu,"cascade",label="Cox-Ingersoll-Ross (CIR) Model",menu=CIRMenu)
tkadd(SMMenu,"command",label="Chan-Karolyi-Longstaff-Sanders (CKLS) Model",
     command=function() {.CKLSGUI()})
tkadd(SMMenu,"command",label="Diffusion Bridge Model",
     command=function() {.diffBridgeGUI()})
tkadd(SMMenu,"command",label="Double-Well Potential Model",
     command=function() {.DWPGUI()})
tkadd(SMMenu,"command",label="Exponential Martingales Process",
     command=function() {.MartExpGUI()})
HWVMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(HWVMenu,"command",label="Hull-White/Vasicek Model",
     command=function() {.HWVGUI()})
tkadd(HWVMenu,"command",label="Flow of Hull-White/Vasicek Model",
     command=function() {.HWVFGUI()})
tkadd(SMMenu,"cascade",label="Hull-White/Vasicek (HWV) Gaussian Diffusion Model",menu=HWVMenu)
hypMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(hypMenu,"command",label="Hyperbolic Process",
     command=function() {.HyprocGUI()})
tkadd(hypMenu,"command",label="General Hyperbolic Diffusion",
     command=function() {.HyprocgGUI()})
tkadd(SMMenu,"cascade",label="Hyperbolic Process",menu=hypMenu)
tkadd(SMMenu,"command",label="Inverse of Feller Square Root Model",
     command=function() {.INFSRGUI()})
tkadd(SMMenu,"command",label="Jacobi Diffusion Process",
     command=function() {.JDPGUI()})
OUMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(OUMenu,"command",label="Ornstein-Uhlenbeck Process",
     command=function() {.OUGUI()})
tkadd(OUMenu,"command",label="Flow of Ornstein-Uhlenbeck Process",
     command=function() {.OUFGUI()})
tkadd(OUMenu,"command",label="Radial Ornstein-Uhlenbeck Process",
     command=function() {.ROUGUI()})
tkadd(SMMenu,"cascade",label="Ornstein-Uhlenbeck Process",menu=OUMenu)
tkadd(SMMenu,"command",label="Pearson Diffusions Process",
     command=function() {.PDPGUI()})
PSMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(PSMenu,"command",label="Stochastic Process The Gamma Distribution",
     command=function() {.StgammaGUI()})
tkadd(PSMenu,"command",label="Stochastic Process The Student Distribution",
     command=function() {.StstGUI()})
tkadd(PSMenu,"command",label="Random Walk",
     command=function() {.SRWGUI()})
tkadd(PSMenu,"command",label="White Noise Gaussian",
     command=function() {.WNGGUI()})
tkadd(SMMenu,"cascade",label="Stochastic Process",menu=PSMenu)

###############################################################################
############################   Parametric Estimation         ##################

EPMenu <- tkmenu(topMenu,tearoff=TRUE)
tkadd(topMenu,"cascade",label="Parametric Estimation",menu=EPMenu)
tkadd(EPMenu,"command",label="Parametric Estimation of Arithmetic Brownian Motion",
     command=function() {.PEABMGUI()})
tkadd(EPMenu,"command",label="Parametric Estimation of Model Black-Scholes",
     command=function() {.PEBSGUI()})
tkadd(EPMenu,"command",label="Parametric Estimation of Hull-White/Vasicek Model",
     command=function() {.PEOUGGUI()})

PE <- tkmenu(topMenu,tearoff=FALSE)
tkadd(PE,"command",label="Exact likelihood Inference",command=function() {.PEOUGUI()})
tkadd(PE,"command",label="Explicit Estimators",command=function() {.PEOUexpGUI()})
tkadd(EPMenu,"cascade",label="Parametric Estimation of Ornstein-Uhlenbeck Model",menu=PE)

###############################################################################
############################Simulation for Numerical Solution##################

SNSMenu <- tkmenu(topMenu,tearoff=TRUE)
tkadd(topMenu,"cascade",label="Numerical Solution of SDE",menu=SNSMenu)
tkadd(SNSMenu,"command",label="Euler Scheme",
     command=function() {.EulerGUI()})
tkadd(SNSMenu,"command",label="Predictor-Corrector Method",
     command=function() {.PredCorrGUI()})
MIMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(MIMenu,"command",label="Milstein Scheme",
     command=function() {.MilsteinGUI()})
tkadd(MIMenu,"command",label="Milstein Second Scheme",
     command=function() {.MilsteinSGUI()})
tkadd(SNSMenu,"cascade",label="Milstein Scheme",menu=MIMenu)
tkadd(SNSMenu,"command",label="Strong Ito-Taylor Scheme",
     command=function() {.STSGUI()})
tkadd(SNSMenu,"command",label="Heun Scheme",
     command=function() {.HeunGUI()})
tkadd(SNSMenu,"command",label="Runge-Kutta Scheme",
     command=function() {.RK3GUI()})

###############################################################################
##############################  Aide  #########################################

AideMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Help",menu=AideMenu)
DOMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(DOMenu,"command",label="Brownian Motion in 2D plane",
     command=function() {.BM2D()})
tkadd(DOMenu,"command",label="Brownian Motion trajectory approxsime by Euler Scheme",
     command=function() {.BMEuler()})
tkadd(DOMenu,"command",label="Simulation Numerical Solution of Stochastic Differential Equation",
     command=function() {.sde.sim()})
tkadd(DOMenu,"command",label="Flow of the Stochastic Processes",
     command=function() {.flow()})
tkadd(DOMenu,"command",label="Stochastic Processes (Models)",
     command=function() {.sde()})
tkadd(AideMenu,"cascade",label="Demos",menu=DOMenu)
tkadd(AideMenu,"separator")
tkadd(AideMenu,"command",label="Start Sim.DiffProc help (.HTML)",
     command= function() {print(help("Sim.DiffProc"))})
tkadd(AideMenu,"command",label="Start Sim.DiffProc help (.PDF)",
     command= function(){
                         browseURL(paste(file.path(.path.package(package="Sim.DiffProc")[1], "doc"),
             "/", "Sim.DiffProc.pdf", sep=""))})
tkadd(AideMenu,"command",label="Start R help system",
     command= function() {help.start()})
tkadd(AideMenu,"separator")
tkadd(AideMenu,"command",label="About Sim.DiffProc", 
     command= function() {tkmessageBox(title="Information",message=paste(" Sim.DiffProc version 1.0 (Wed Jan 05 11:52:51 2011).\n","BOUKHETALA Kamal <kboukhetala@usthb.dz>.\n", "GUIDOUM Arsalane <starsalane@gmail.com>.\n",
             "University of Sciences and Technology Houari Boumediene (USTHB)\n","Faculty of Mathematics\n","Department of Probabilities and Statistics.\n",
             "Copyright (C) 2011 Algeria."))})

###############################################################################
##############################   Run    #######################################

## fontHeading <- tkfont.create(family="times",size=11,weight="bold")
Run.but <- tkbutton(tt,text="Eval Code",command=function(){evalGUI()},width=43)##,foreground="black", background="skyblue4", font=fontHeading)
tkgrid(Run.but,row=10,sticky="news",column=0)
Clear.but <- tkbutton(tt,text="Clear",command=function(){tkdelete(txt, '@0,0', 'end' )},width=45)##,foreground="black", background="skyblue4", font=fontHeading)
tkgrid(Clear.but,sticky="news",row=10,column=1)

###############################################################################
################################    End         ###############################

site <- function(){browseURL("http://www.usthb.dz")}
## fontHeading1 <- tkfont.create(family="times",size=10,weight="bold",slant="italic")
USTHB.but <- tkbutton(tt,text="     University of Sciences and Technology Houari Boumediene (USTHB)
Faculty of Mathematics , Department of Probabilities and Statistics , Algeria",command=function(){site()})
tkgrid(USTHB.but,sticky="news",row=11,column=0,columnspan=2)
###############################################################################
###############################################################################
})
}

