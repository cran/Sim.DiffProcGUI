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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                   Brownian Motion\nCreating Flow of Arithmetic Brownian Motion ?",command=function(){print(help("ABMF"))},width=45)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                Brownian Motion\nCreating Arithmetic Brownian Motion ?",command=function(){print(help("ABM"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="              Brownian Motion\nCreating Flow of Brownian Bridge ?",command=function(){print(help("BBF"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="        Brownian Motion\nCreating Brownian Bridge ?",command=function(){print(help("BB"))},width=30)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Stochastic Models\n  Bessel Process ?",command=function(){print(help("Besselp"))},width=20)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 1 (x0 =! 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (alpha >=2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Alpha : "), alpha.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                Brownian Motion Property\nEmpirical Covariance for Brownian Motion ?",command=function(){print(help("BMcov"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
         C      <- as.numeric(tclObj(C))
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text=" Brownian Motion Property\nLimit for Brownian Motion ?",command=function(){print(help("BMinf"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="   Brownian Motion Property\nInvariance by Reversal of Time ?",command=function(){print(help("BMIrt"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="           Ito Integral\nIntegral(W(s)dW(s),0,t) ?",command=function(){print(help("BMIto1"))},width=45)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="           Ito Integral\nIntegral(alpha*dW(s),0,t) ?",command=function(){print(help("BMItoC"))},width=45)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="           Ito Integral\nIntegral(W(s)^n*dW(s),0,t) ?",command=function(){print(help("BMItoP"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="           Ito Integral\nIntegral(s*dW(s),0,t) ?",command=function(){print(help("BMItoT"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                                  Brownian Motion\nFlow of Brownian Motion by The Normal Distribution ?",command=function(){print(help("BMNF"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="          Brownian Motion \nby The Normal Distribution ?",command=function(){print(help("BMN"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                     Brownian Motion Property\nTrajectories Brownian Lies Between The Two Curves ?",command=function(){print(help("BMP"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Flow of Brownian Motion \n    by a Random Walk ?",command=function(){print(help("BMRWF"))},width=45)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text=" Brownian Motion \nby a Random Walk ?",command=function(){print(help("BMRW"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion Property", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="         Brownian Motion Property\nBrownian Motion invariance by scaling ?",command=function(){print(help("BMscal"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="    Stratonovitch Integral\nIntegral(alpha o dW(s),0,t) ?",command=function(){print(help("BMStraC"))},width=55)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="    Stratonovitch Integral\nIntegral(W(s) o dW(s),0,t) ?",command=function(){print(help("BMStra"))},width=55)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="    Stratonovitch Integral\nIntegral(W(s)^n o dW(s),0,t) ?",command=function(){print(help("BMStraP"))},width=55)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="    Stratonovitch Integral\nIntegral(s o dW(s),0,t) ?",command=function(){print(help("BMStraT"))},width=55)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                         Stochastic Models\nConstant Elasticity of Variance (CEV) Models ?",command=function(){print(help("CEV"))},width=46)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="           Stochastic Models\nCox-Ingersoll-Ross (CIR) Models ?",command=function(){print(help("CIR"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                 Stochastic Models\nThe Modified CIR and Hyperbolic Process ?",command=function(){print(help("CIRhy"))},width=46)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                       Stochastic Models\nChan-Karolyi-Longstaff-Sanders (CKLS) Models ?",command=function(){print(help("CKLS"))},width=55)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="    Stochastic Models\nDiffusion Bridge Model ?",command=function(){print(help("diffBridge"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="        Stochastic Models\nDouble-Well Potential Model ?",command=function(){print(help("DWP"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="we")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n                Euler Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Flow of Geometric Brownian Motion ?\n                   Model of Black-Scholes?",command=function(){print(help("GBMF"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Brownian Motion", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Creating Geometric Brownian Motion ?\n             Model of Black-Scholes?",command=function(){print(help("GBM"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n               Heun Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="            Stochastic Models\nFlow of Hull-White/Vasicek (HWV)? \n     Gaussian Diffusion Models ?",command=function(){print(help("HWVF"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="        Stochastic Models\nHull-White/Vasicek (HWV) \nGaussian Diffusion Models ?",command=function(){print(help("HWV"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="         Stochastic Models\nGeneral Hyperbolic Diffusion ?",command=function(){print(help("Hyprocg"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="  Stochastic Models\nHyperbolic Process ?",command=function(){print(help("Hyproc"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
    
   tkgrid(getDataButton, row=3, column=1)
  }
ttI <- tktoplevel(width=400, height=50)
tkwm.resizable(ttI, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(ttI, Rico)
tk2ico.destroy(Rico)
rm(Rico)
tktitle (ttI) <- "Sim.DiffProc" 
but <- tkbutton(ttI,text="\nImport Data From...?\n",command=function(){print(help("read.table"))},width=45)
tkgrid(but,row=1,columnspan = 3,sticky="we")
dataFormat <- tclVar(availableDataFormat[1])
dataFormat.comboBox <- ttkcombobox(ttI, values=availableDataFormat, textvariable=dataFormat, width=20)
##tkgrid (tklabel(ttI, text="Import Data From...", font=tkfont.create(size=10,weight="bold"),foreground="blue"), row=0, column=1)
tkgrid (tklabel(ttI, text="Choose a Data Format :"), row=2, column=0)
tkgrid (dataFormat.comboBox, row=2, column=1, sticky="e")
tkbind (dataFormat.comboBox, "<<ComboboxSelected>>", onChange)  
exitButton <- tkbutton(ttI, text="Exit", command=function() tkdestroy(ttI), width=20)
tkgrid(exitButton, row=3, column=2,sticky="w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                  Stochastic Models\nInverse of Feller Square Root Models ?",command=function(){print(help("INFSR"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral vs Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
##tkgrid(tklabel(tt, text = "                           Simulation \nIntegral(W(s)dW(s),0,t) vs Integral(W(s) o dW(s),0,t)", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=2,sticky="ew")

but <- tkbutton(tt,text="                               Simulation \nIntegral(W(s)dW(s),0,t) vs Integral(W(s) o dW(s),0,t)",width=26)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
N.entry       <- tkentry(tt, textvariable=N,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral vs Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
##tkgrid(tklabel(tt, text = "        Integral(W(s)^n*dW(s),0,t) vs Integral(W(s)^n o dW(s),0,t)", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=2,sticky="ew")
but <- tkbutton(tt,text="                                       Simulation\nIntegral(W(s)^n*dW(s),0,t) vs Integral(W(s)^n o dW(s),0,t)",width=26)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
N.entry       <- tkentry(tt, textvariable=N,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
power.entry   <- tkentry(tt, textvariable=power,width = 25)
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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Ito Integral vs Stratonovitch Integral", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
##tkgrid(tklabel(tt, text = "     Integral(s*dW(s),0,t) vs Integral(s o dW(s),0,t)", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=2,sticky="ew")
but <- tkbutton(tt,text="                               Simulation\nIntegral(s*dW(s),0,t) vs Integral(s o dW(s),0,t)",width=26)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
N.entry       <- tkentry(tt, textvariable=N,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="       Stochastic Models\nJacobi Diffusion Process ?",command=function(){print(help("JDP"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="           Stochastic Models\nExponential Martingales Process ?",command=function(){print(help("MartExp"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n              Milstein Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n      Milstein Second Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                 Stochastic Models\nFlow of Ornstein-Uhlenbeck Process ?",command=function(){print(help("OUF"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="          Stochastic Models\nOrnstein-Uhlenbeck Process ?",command=function(){print(help("OU"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
    Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
    tk2ico.set(tf, Rico)
    tk2ico.destroy(Rico)
    frame1 <- tkframe(tf, relief = "groove", borderwidth = 2)
    frame2 <- tkframe(tf, relief = "groove", borderwidth = 2)
    frame3 <- tkframe(tf, relief = "groove", borderwidth = 2)
    devframe <- tkframe(frame2, relief = "groove", borderwidth = 2)
    done <- tclVar(0)
    formatvar <- tclVar(2)
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
                png(filename = filename, width = width, height = height)
            }
        }
        else if (outform == 6) {
            filename <- tclvalue(tkgetSaveFile(initialfile = "Rplots.jpeg", 
                defaultextension = ".jpeg", title = "Save graph...", 
                filetypes = "{JPEG {.jpeg .jpg}} {{All Files} {*.*}}"))
            if (filename != "") {
                jpeg(filename = filename, width = width, height = height)
            }
        }
        ndev <- dev.cur()
        dev.set(odev)
        dev.copy(which = ndev)
        dev.off()
        tkdestroy(tf)
    }
    ##tkgrid(tklabel(tf, text = "Save graphic", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
    ##    columnspan = 2)
	but <- tkbutton(tf,text=" \nSave Graphic ?\n",command=function(){print(help("save.image"))},width=18)
    tkgrid(but,columnspan = 2,sticky="we")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="       Stochastic Models\nPearson Diffusions Process ?",command=function(){print(help("PDP"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Arithmetic Brownian Motion ?\n                       Exact likelihood Inference",command=function(){print(help("PEABM"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Black-Scholes Models ?\n                 Exact likelihood Inference",command=function(){print(help("PEBS"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Ornstein-Uhlenbeck Model ?\n                               Explicit Estimators",command=function(){print(help("PEOUexp"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Hull-White/Vasicek Model ?\n                    Exact likelihood Inference",command=function(){print(help("PEOUG"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Parametric Estimation", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Parametric Estimation of Ornstein-Uhlenbeck Model ?\n                      Exact likelihood Inference",command=function(){print(help("PEOU"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")
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

.choosdata <- function()
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
	tkwm.title(tf,"Sim.DiffProc~~Show Dataframe")
	done <- tclVar(0)	
	tlb <- tklistbox(tf)
	scr <- tkscrollbar(tf, repeatinterval=5, command=function(...)tkyview(tlb,...))
	tkconfigure(tlb, yscrollcommand=function(...)tkset(scr,...))
	frame1 <- tkframe(tf, relief="groove", borderwidth=2)
	cancel.but <- tkbutton(frame1, text="Dismiss", command=function()tkdestroy(tf))
	submit.but <- tkbutton(frame1, text="Show", default="active", command=function()tclvalue(done)<-1)
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
	eval(parse(text=paste(choix, " <<- edit(", choix, ")", sep="")))
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n    Predictor-Corrector Method ?",command=function(){print(help("PredCorr"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n          Runge-Kutta Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Models", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="                Stochastic Models\nRadial Ornstein-Uhlenbeck Process ?",command=function(){print(help("ROU"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
plot(0:20,0:20,type="n",xlab="",axes=FALSE,ylab="",main=expression("Stochastic Processes":dX[t]==(alpha+beta*X[t])*dt+sigma*X[t]^gamma*dW[t]))
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
    points(t,X,type="l",col="blue")
    ##mtext(paste(date()),adj=0.5,col="blue",line=3.0,cex=1.4)
    mtext(bquote(t[i]==.(round(t[i],2))),adj=0,col="red",line=0.32,cex=1.2)
    mtext(bquote(X[t[i]]==.(round(X[i],2))),adj=0.2,col="red",line=0.2,cex=1.2)
    mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=0.9,adj=1,col="red")
    mtext(bquote(t[0]==.(t0)),line=0.9,cex=0.9,adj=1,col="red")
    mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria"),side = 1, line = 4, adj = 0.5, cex = .66)
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Stochastic Process\n Random Walk ?",command=function(){print(help("SRW"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="     Stochastic Process \nThe Gamma Distribution ?",command=function(){print(help("Stgamma"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Simulation for Numerical Solution", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="Simulation for Numerical Solution\n      Strong Ito-Taylor Scheme ?",command=function(){print(help("snssde"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="     Stochastic Process \nThe Student Distribution ?",command=function(){print(help("Stst"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Stochastic Process", font = tkfont.create(size=10,weight="bold"),foreground="blue"), 
##        columnspan = 3,row=1)
but <- tkbutton(tt,text="    Stochastic Process\nWhite Noise Gaussian ?",command=function(){print(help("WNG"))},width=40)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

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
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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

.YourSolution <-
function(Sol,Start,End,dt,x0,Xlab,Ylab,Main,Pch=1,
                     Cex=1,Lty=1,Lwd=1,cole="red",LogX=0,LogY=0,
                     Type="l",Grid=FALSE,Las)
              {
if (!is.expression(Sol)) stop("The Solution must be expressions f(t,X,w)")

A <- function(t,x,w) eval(Sol)


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
X[1] <- x0
for (i in 2:(N+1)){
X[i] = A(t[i-1],X[i-1],w[i-1])
}
if ( LogX == 0 & LogY == 0) {
plot(t,eval(Sol),xlab=Xlab,ylab=Ylab,main=Main,cex=Cex,lty=Lty,lwd=Lwd,pch=Pch,las=Las,col=cole,type=Type)
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Plot Your Solution", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
##        columnspan = 2,row=1)
##DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("plot")))
##tkgrid(DimHlp.but,row=1,column=2,sticky="w")
but <- tkbutton(tt,text="\nPlot Your Solution\n",command=function(){print(help("plot"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

Sol <- tclVar("expression(x0*exp((2-0.5*4)*t+2*w))")
Start <- tclVar(0)
End <- tclVar(1)
dt <- tclVar(0.001)
x0 <- tclVar(10)
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
         tclvalue(x0)       <-""
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
x0.entry        <- tkentry(tt, textvariable=x0,width = 30)
Start.entry     <- tkentry(tt, textvariable=Start,width = 30)
End.entry       <- tkentry(tt, textvariable=End,width = 30)
Ylab.entry      <- tkentry(tt, textvariable=Ylab,width = 30)
Xlab.entry      <- tkentry(tt, textvariable=Xlab,width = 30)
Main.entry      <- tkentry(tt, textvariable=Main,width = 30)
Pch.entry       <- tkentry(tt, textvariable=Pch,width = 27)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole)
Type.entry      <- tkentry(tt, textvariable=Type)
Grid.entry      <- tkentry(tt, textvariable=Grid)
LogX.entry      <- tkentry(tt, textvariable=LogX)
LogY.entry      <- tkentry(tt, textvariable=LogY)
USTHB <- function(...) 
        {
         Sol       <- tclvalue(Sol) 
         dt        <- as.numeric(tclObj(dt))
         x0        <- as.numeric(tclObj(x0))
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
         eval(substitute(.YourSolution(Sol=eval(e1),dt=dt,x0=x0,Start=Start,End=End,Xlab=Xlab,Ylab=Ylab,
              Main=Main,Pch=Pch,Lty=Lty,Lwd=Lwd,Cex=Cex,cole=cole
              ,Type=Type,Grid=Grid,LogX=LogX,LogY=LogY,Las=Las)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and X,w. \nExample : expression(x0*exp((2-0.5*4)*t+2*w)) \nt is the time. \nw it is Winner Process.",icon="info",type="ok"))
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

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example :x0 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Xlab = Time.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Xlab : "), Xlab.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Ylab = X(t).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Ylab : "), Ylab.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Title = Bessel Process.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Title : "), Main.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() print(.pchShow()))
tkgrid(tklabel(tt,text="Points symbols : "),sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=10, column=1, sticky="e")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Colors : "),sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=27)
tkgrid(COLE.comboBox, row=11, column=1,sticky="e")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Line width : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=12, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=FALSE, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=12, column=1,sticky="e")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=13, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=FALSE, variable=Cex,
                   resolution=0.1, orient="horizontal")
tkgrid(slider1,row=13, column=1,sticky="e")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Grid : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Grid),row=14,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Grid),row=14,column=1)
 

tkgrid(tklabel(tt,text = "Logarithmic Axis :"),sticky = "w")
tkgrid(tkcheckbutton(tt,text=" X",variable = LogX),row=15,columnspan = 2)
tkgrid(tkcheckbutton(tt,text="  Y",variable = LogY),row=15,column = 1)


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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Plot Your Data", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
##        columnspan = 2,row=1)
##DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("plot")))
##tkgrid(DimHlp.but,row=1,column=2,sticky="w")
but <- tkbutton(tt,text="\nPlot Your Data\n",command=function(){print(help("plot"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")
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
         tclvalue(Grid)     <- "FALSE" 
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
Pch.entry       <- tkentry(tt, textvariable=Pch)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole)
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
tkgrid(tklabel(tt,text="Points symbols : "),sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=8, column=1, sticky="e")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Colors : "),sticky="w")
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
                   showvalue=FALSE, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=10, column=1,sticky="e")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=11, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=FALSE, variable=Cex,
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Points Your Data", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
##        columnspan = 2,row=1)
##DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("points")))
##tkgrid(DimHlp.but,row=1,column=2,sticky="w")
but <- tkbutton(tt,text="\nPoints Your Data\n",command=function(){print(help("points"))},width=30)
tkgrid(but,row=1,columnspan = 3,sticky="ew")
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
Data.entry      <- tkentry(tt, textvariable=Data,width = 25)
delta.entry     <- tkentry(tt, textvariable=delta,width = 25)
Start.entry     <- tkentry(tt, textvariable=Start,width = 25)
Pch.entry       <- tkentry(tt, textvariable=Pch)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 25)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 25)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 25)
cole.entry      <- tkentry(tt, textvariable=cole)
Type.entry      <- tkentry(tt, textvariable=Type,width = 25)
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
tkgrid(tklabel(tt,text="Pch : "),sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=23)
tkgrid (Format.comboBox, row=5, column=1, sticky="e")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Color : "),sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=23)
tkgrid(COLE.comboBox, row=6, column=1,sticky="e")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Lwd Value : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=7, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=FALSE, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=7, column=1,sticky="e")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=8, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=FALSE, variable=Cex,
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
tkgrid(frame1, rowspan = 4,row=9,column=0, sticky = "nw",padx=5,pady=5)

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
tkgrid(frame2, rowspan = 4,row=10, sticky = "ne",columnspan=2,padx=5,pady=5)
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
##tkgrid(tklabel(tt, text = "Points Your Solution", font = tkfont.create(size=14,weight="bold"),foreground="blue"), 
##       columnspan = 2,row=1)
##DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("points")))
##tkgrid(DimHlp.but,row=1,column=2,sticky="w")
but <- tkbutton(tt,text="\nPoints Your Solution\n",command=function(){print(help("points"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

Sol <- tclVar("expression(x0*exp((2-0.5*4)*t+2*w))")
Start <- tclVar(0)
End <- tclVar(1)
dt <- tclVar(0.001)
x0 <- tclVar(1)
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
         tclvalue(x0)       <-""
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
x0.entry        <- tkentry(tt, textvariable=x0,width = 30)
Start.entry     <- tkentry(tt, textvariable=Start,width = 30)
End.entry       <- tkentry(tt, textvariable=End,width = 30)
Pch.entry       <- tkentry(tt, textvariable=Pch)
Lty.entry       <- tkentry(tt, textvariable=Lty,width = 30)
Lwd.entry       <- tkentry(tt, textvariable=Lwd,width = 30)
Cex.entry       <- tkentry(tt, textvariable=Cex,width = 30)
cole.entry      <- tkentry(tt, textvariable=cole)
Type.entry      <- tkentry(tt, textvariable=Type,width = 30)
USTHB <- function(...) 
        {
         Sol       <- tclvalue(Sol) 
         dt        <- as.numeric(tclObj(dt))
         x0        <- as.numeric(tclObj(x0))
         Start     <- as.numeric(tclObj(Start))
         End       <- as.numeric(tclObj(End))
         Pch       <- as.numeric(tclObj(Pch))
         Lty       <- as.numeric(tclObj(Lty)) 
         Lwd       <- as.numeric(tclObj(Lwd)) 
         Cex       <- as.numeric(tclObj(Cex))
         cole      <- as.character(tclObj(cole))
         Type      <- as.character(tclObj(Type))
         e1        <- try(parse(text=Sol)) 
         eval(substitute(.AddSolution(Sol=eval(e1),dt=dt,x0=x0,Start=Start,End=End,
              Pch=Pch,Lty=Lty,Lwd=Lwd,Cex=Cex,cole=cole,Type=Type)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and w. \nExample : expression(10*exp((2-0.5*4)*t+2*w)) \nt is time. \nw is Winner Process.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Your Solution : "), Sol.entry,sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example :  x0 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "),x0.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example :  Start = 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Start : "), Start.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example : End = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="End : "), End.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example : Deltat = 0.01).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Deltat : "), dt.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() print(.pchShow()))
tkgrid(tklabel(tt,text="Points symbols : "),sticky="w")
Format <- c("0","1", "2", "3", "4","5","6","7","8","9","10","12","13","14","15","16","17","18",
            "19","20","21","22","23","24","25")
Format.comboBox <- ttkcombobox(tt, values=Format, textvariable=Pch, width=27)
tkgrid (Format.comboBox, row=7, column=1, sticky="e")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() print(help("colors")))
tkgrid(tklabel(tt,text="Change Colors : "),sticky="w")
COLE <- c("black","white", "red", "violet", "blue","green","yellow","orange","grey","bisque","brown","coral","cornsilk","cyan","darkcyan","darkgrey","darkorange","darksalmon",
          "darkviolet","firebrick","lightgreen","lightgrey","linen","magenta","mediumblue","maroon","mintcream","navy","orchid","pink",
          "tomato","wheat","turquoise","thistle","tan","whitesmoke","snow","salmon","plum","peachpuff","papayawhip","mistyrose","navajowhite","lightgoldenrod",
          "khaki","ivory","honeydew","gold","deeppink","darkturquoise","beige","azure")
COLE.comboBox <- ttkcombobox(tt, values=COLE, textvariable=cole, width=27)
tkgrid(COLE.comboBox, row=8, column=1,sticky="e")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The line width (Example Lwd = 2) .",icon="info",type="ok"))
SliderValueLabel <- tklabel(tt,text=as.character(tclvalue(Lwd)))
tkgrid(tklabel(tt,text="Line width : "),SliderValueLabel,sticky="w")
tkgrid(tklabel(tt,text=""),row=9, column=1)
tkconfigure(SliderValueLabel,textvariable=Lwd)
slider <- tkscale(tt, from=1, to=10,
                   showvalue=FALSE, variable=Lwd,
                   resolution=0.5, orient="horizontal")
tkgrid(slider,row=9, column=1,sticky="e")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default (Example Cex = 0.5) .",icon="info",type="ok"))
SliderValueLabel1 <- tklabel(tt,text=as.character(tclvalue(Cex)))
tkgrid(tklabel(tt,text="Cex Value : "),SliderValueLabel1,sticky="w")
tkgrid(tklabel(tt,text=""),row=10, column=1)
tkconfigure(SliderValueLabel1,textvariable=Cex)
slider1 <- tkscale(tt, from=0, to=5,
                   showvalue=FALSE, variable=Cex,
                   resolution=0.1, orient="horizontal")
tkgrid(slider1,row=10, column=1,sticky="e")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")


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
tkgrid(frame1, rowspan = 4,row=12,column=0, sticky = "ew",padx=5,pady=5)

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
tkgrid(frame2, rowspan = 4,row=12, sticky = "ew",column=1,padx=5,pady=5)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Add Your Solution",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AddSolution <-
function(Sol,Start,End,dt,x0,Pch=1,
                     Cex=1,Lty=1,Lwd=1,cole="red",Type="l")
              {
if (!is.expression(Sol)) stop("The Solution must be expressions f(t,X,w)")

A <- function(t,x,w) eval(Sol)


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
X[1] <- x0
for (i in 2:(N+1)){
X[i] = A(t[i-1],X[i-1],w[i-1])
}
points(t,eval(Sol),lwd=Lwd,cex=Cex,col=cole,type=Type,lty=Lty,pch=Pch)
}

##########################################################################################################
##########################################################################################################
##########################################################################################################

.RadialP_1GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Model~~Radial Process")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Radial Process ?\n M (S=1,Sigma)",command=function(){print(help("RadialP_1"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(1000)
T  <- tclVar(1)
t0 <- tclVar(0)
R0 <- tclVar(2)
Dt <- tclVar(0.001)
K  <- tclVar(2)
Sigma <- tclVar(0.3)
Methods <- tclVar("Euler")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(R0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(K)      <-""
         tclvalue(Sigma)  <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 20)
t0.entry      <- tkentry(tt, textvariable=t0,width = 20)
T.entry       <- tkentry(tt, textvariable=T,width = 20)
R0.entry      <- tkentry(tt, textvariable=R0,width = 20)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 20)
K.entry       <- tkentry(tt, textvariable=K,width = 20)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 20)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         R0     <- as.numeric(tclObj(R0))
         Dt     <- as.numeric(tclObj(Dt))
         K      <- tclvalue(K)      
         Sigma  <- tclvalue(Sigma) 
         e1     <- try(parse(text=K))
         e2     <- try(parse(text=Sigma))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
        eval(substitute(RadialP_1(N=N,t0=t0,Dt=Dt,T=T,R0=R0,K=eval(e1),Sigma=eval(e2),Output=Output,Methods=Methods)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="R0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (R0) : "), R0.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive. 2*K > Sigma^2",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive. 2*K > Sigma^2",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")


frame1 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tklabel(frame1, text = "Methods"), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "Euler Scheme", value = "Euler", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Milstein Scheme", value = "Milstein", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Second Milstein Scheme", value = "MilsteinS", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Strong Ito-Taylor Scheme Order 1.5", value = "Ito-Taylor", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Heun Scheme", value =  "Heun", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Runge-Kutta Scheme Order3", value = "RK3", variable = Methods), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=10,columnspan=5,padx=5,pady=5)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=14,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=14,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.RadialP2D_1GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~2D Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Two-Dimensional Attractive Model?\n                    M (S=1,Sigma)",command=function(){print(help("RadialP2D_1"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(1000)
T        <- tclVar(1)
t0       <- tclVar(0)
Dt       <- tclVar(0.001)
X0       <- tclVar(1)
Y0       <- tclVar(2)
v        <- tclVar(0.5)
K        <- tclVar(3)
Sigma    <- tclVar(0.4)
Output   <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(v)            <-"0.2"
         tclvalue(K)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)           <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y0)           <-""
         tclvalue(X0)           <-""
         tclvalue(Sigma)        <-""
         tclvalue(Output)       <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 22)
K.entry       <- tkentry(tt, textvariable=K,width = 22)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 22)
v.entry       <- tkentry(tt, textvariable=v,width = 22)
t0.entry      <- tkentry(tt, textvariable=t0,width = 22)
T.entry       <- tkentry(tt, textvariable=T,width = 22)
X0.entry      <- tkentry(tt, textvariable=X0,width = 22)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 22)
Y0.entry       <- tkentry(tt, textvariable=Y0,width = 22)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         Dt        <- as.numeric(tclObj(Dt))
         X0        <- as.numeric(tclObj(X0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y0        <- as.numeric(tclObj(Y0)) 
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(RadialP2D_1(N,t0,Dt,T=1,X0,Y0,v,K,Sigma,Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="X0 =! 0 or Y0 =! 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="X0 =! 0 or Y0 =! 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y0) : "), Y0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" (X0^2) + (Y0^2) > threshold (Example threshold = 0.5).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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

.RadialP2D_1PCGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~2D Polar Corrd")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="       Two-Dimensional Attractive Model?\n   Models(S=1,Sigma) in Polar coordinates",command=function(){print(help("RadialP2D_1PC"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(1000)
T        <- tclVar(1)
t0       <- tclVar(0)
R0       <- tclVar(2)
ThetaMax <- tclVar(2*pi)
K        <- tclVar(2)
sigma    <- tclVar(0.5)
output   <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(K)            <-""
         tclvalue(T)            <-""
         tclvalue(t0)           <-""
         tclvalue(ThetaMax)     <-""
         tclvalue(R0)           <-""
         tclvalue(sigma)        <-""
         tclvalue(output)       <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 22)
K.entry       <- tkentry(tt, textvariable=K,width = 22)
t0.entry      <- tkentry(tt, textvariable=t0,width = 22)
T.entry       <- tkentry(tt, textvariable=T,width = 22)
R0.entry      <- tkentry(tt, textvariable=R0,width = 22)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 22)
ThetaMax.entry<- tkentry(tt, textvariable=ThetaMax,width = 22)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         R0        <- as.numeric(tclObj(R0))
         sigma     <- as.numeric(tclObj(sigma))  
         ThetaMax  <- as.character(tclObj(ThetaMax)) 
         output    <- as.character(tclObj(output))
         e1        <- try(parse(text=ThetaMax))
        eval(substitute(RadialP2D_1PC(N=N,R0=R0,t0=t0,T=T,ThetaMax=eval(e1),K=K,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example R0 = 1 (R0 > 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (R0) : "), R0.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example  theta = 2*pi.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Polar coordinates (theta) : "), ThetaMax.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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

.RadialP3D_1GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~ 3D Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Three-Dimensional Attractive Model?\n                    M (S=1,Sigma)",command=function(){print(help("RadialP3D_1"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(1000)
T        <- tclVar(1)
Dt       <- tclVar(0.001)
t0       <- tclVar(0)
X0       <- tclVar(2)
Y0       <- tclVar(0)
Z0       <- tclVar(1)
v        <- tclVar(0.4)
K        <- tclVar(4)
Sigma    <- tclVar(0.5)
Output   <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(v)            <-"0.4"
         tclvalue(K)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)            <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y0)           <-""
         tclvalue(X0)           <-""
         tclvalue(Z0)           <-""
         tclvalue(Sigma)        <-""
         tclvalue(Output)       <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
K.entry       <- tkentry(tt, textvariable=K,width = 30)
v.entry       <- tkentry(tt, textvariable=v,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
X0.entry      <- tkentry(tt, textvariable=X0,width = 30)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 30)
Y0.entry      <- tkentry(tt, textvariable=Y0,width = 30)
Z0.entry      <- tkentry(tt, textvariable=Z0,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         t0        <- as.numeric(tclObj(t0))
         Dt        <- as.numeric(tclObj(Dt))
         T         <- as.numeric(tclObj(T))
         X0        <- as.numeric(tclObj(X0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y0        <- as.numeric(tclObj(Y0)) 
         Z0        <- as.numeric(tclObj(Z0))
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(RadialP3D_1(N,t0,Dt,T=1,X0,Y0,Z0,v,K,Sigma,Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X0 = 3.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y0) : "), Y0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Z0) : "), Z0.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" (X0^2) + (Y0^2) +(Z0^2) > threshold (Example threshold = 0.5).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="vonstant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="vonstant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=12,column=1)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.SimFPT_M1GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="Simulation the First Passage Time (FPT)?\n                       M (S=1,Sigma)",command=function(){print(help("tho_M1"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(1000)
M  <- tclVar(100)
T  <- tclVar(1)
t0 <- tclVar(0)
R0 <- tclVar(1)
v  <- tclVar(0.5)
K  <- tclVar(4)
sigma <- tclVar(0.9)
Methods <- tclVar("Euler")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(R0)     <-""
         tclvalue(v)      <-""
         tclvalue(K)      <-""
         tclvalue(sigma)  <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 20)
M.entry       <- tkentry(tt, textvariable=M,width = 20)
t0.entry      <- tkentry(tt, textvariable=t0,width = 20)
T.entry       <- tkentry(tt, textvariable=T,width = 20)
R0.entry      <- tkentry(tt, textvariable=R0,width = 20)
v.entry       <- tkentry(tt, textvariable=v,width = 20)
K.entry       <- tkentry(tt, textvariable=K,width = 20)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 20)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
USTHB <- function(N,M,t0,v,T,R0,K,sigma,Output,Methods) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         R0     <- as.numeric(tclObj(R0))
         v      <- as.numeric(tclObj(v))
         K      <- tclvalue(K)      
         sigma  <- tclvalue(sigma) 
         e1     <- try(parse(text=K))
         e2     <- try(parse(text=sigma))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
        eval(substitute(tho_M1(N=N,M=M,t0=t0,v=v,T=T,R0=R0,K=eval(e1),sigma=eval(e2),Output=Output,Methods=Methods)))
}

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Size of FPT = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of FPT : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" R0 > threshold (Example threshold = 0.5).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="R0 > threshold (Example R0 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (R0) : "), R0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( 2*K > Sigma^2 ).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( 2*K > Sigma^2 )",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")


frame1 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tklabel(frame1, text = "Methods"), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "Euler Scheme", value = "Euler", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Milstein Scheme", value = "Milstein", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Second Milstein Scheme", value = "MilsteinS", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Strong Ito-Taylor Scheme Order 1.5", value = "Ito-Taylor", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Heun Scheme", value =  "Heun", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Runge-Kutta Scheme Order3", value = "RK3", variable = Methods), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=11,columnspan=5,padx=5,pady=5)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=15,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB(N,M,t0,v,T,R0,K,sigma,Output,Methods)})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})
}

.hist.FPT_M1GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but2 <- tkbutton(tt,text="Histograms for First Passage Time (FPT)?\n                       M (S=1,Sigma)",command=function(){print(help("hist_meth"))},width=40)
tkgrid(but2,row=1,columnspan = 3,sticky="ew")
tclvalue(FPT) <- FPT
.histtho_M1 <-
function(Breaks,Prob = c("TRUE","FALSE"),AjusGamma=c("TRUE","FALSE"))
           {
x <- seq(min(FPT),max(FPT),by=0.001)
if (Breaks=='Sturges')   {Breaks <- nclass.Sturges(FPT)}
if (Breaks=='scott')     {Breaks <- nclass.scott(FPT)}
if (Breaks=='FD')        {Breaks <- nclass.FD(FPT)}

hist((1/FPT),breaks = Breaks,probability = Prob,col="light blue",border="dark blue",
     xlab = expression(tilde(tau[c])^(1)==1/tau[c]^(1)),las=1,main="")
box()
mtext(expression("Histogram for the First Passage Time (FPT)": tilde(tau[c])^(1)),line=2.5,adj=0.5,cex=1,col="black")
mtext(bquote(nclass==.(Breaks)),adj=0,line=0.2,cex=1,col="blue")

if (AjusGamma == TRUE){
Y <- (1/FPT)
B <- (mean(Y)^2/var(Y))
C <- mean(Y)/var(Y)
curve(dgamma(x,B,C), col = "red", lwd = 2, add = TRUE)
mtext(bquote("law" :Gamma(.(round(B,2)),.(round(C,2)))),adj=1,line=0.2,cex=1,col="red")
}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sun Jan 09 11:20:21 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

.SUMMY <- function(H=c("TRUE","FALSE"))
       {
if(H==TRUE){
paste("Summary :","\n","Length =",length(1/FPT),"\n",
                         "Min =",round(min((1/FPT)),4),"\n",
                         "Max =",round(max((1/FPT)),4),"\n",
                         "Median =",round(median((1/FPT)),4),"\n",
                         "Mean =",round(mean((1/FPT)),4),"\n",
                         "Var =",round(var((1/FPT)),4),"\n",
                         "sd =",round(sd((1/FPT)),4),"\n",
                         "Gamma Distribution:","\n",
                         "Shape =",round((mean(1/FPT)^2/var(1/FPT)),4),"\n",
                         "Rate =",round(mean(1/FPT)/var(1/FPT),4))
}
}

.FCREP_M1 <-
function(H=c("TRUE","FALSE"))
       {
x <- seq(min(FPT),max(FPT),by=0.001)
if(H==TRUE){
X <- (1/FPT)
n <- length(X)
y <- sort(X)
f <- numeric()
for ( i in 1:n)
     {
     f[i] <- (i/n)
     }
plot(y,f,type="p",pch="*",las=1,xlab = expression(tilde(tau[c])^(1)==1/tau[c]^(1)),ylab="Frequence")
points(y,f,type="n",panel.frist=grid(col="gray"))
mtext(expression("Empirical Distribution for FPT": tilde(tau[c])^(1)),line=2.5,adj=0.5,cex=1,col="black")
a <- mean(y)^2/var(y)
b <- mean(y)/var(y)
curve(pgamma(x,a,b), col = "red", lwd = 2, add = TRUE,panel.first=grid(col="gray"))
mtext(bquote("law" :Gamma(.(round(a,2)),.(round(b,2)))),adj=0,line=0.2,cex=1,col="red")
legend("topleft",bg="gray85",border="gray",c("Empirical Distr","Gamma Law"),pch=c("*",""),col=c("black","red"),lwd=c("",2),lty=c(0,1))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sun Jan 09 11:20:21 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
}

Breaks    <- tclVar(nclass.Sturges(FPT))
Prob      <- tclVar("TRUE")
AjusGamma <- tclVar("FALSE")
Fcnt      <- tclVar("FALSE")

tkentry            <- ttkentry
Breaks.entry       <- tkentry(tt, textvariable=Breaks)
Prob.entry         <- tkentry(tt, textvariable=Prob)

USTHB2 <- function(...) 
        {
         Breaks <- as.numeric(tclObj(Breaks))
         Prob   <- as.character(tclObj(Prob))
         AjusGamma   <- as.character(tclObj(AjusGamma))
        eval(substitute(.histtho_M1(Breaks,Prob,AjusGamma)))
        }

    replot.maybe <- function(...)
    {
        if (as.numeric(tclObj(Breaks)) != nclass.Sturges(FPT)) USTHB2()
    }

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 10)
butb <- tkbutton(frame2,text="histograms ?",command=function(){print(help("hist"))},width=10)
tkgrid(butb,row=2,sticky = "ew")

tkgrid(tklabel(frame2,text = "Numbre of classe : "),sticky = "w")
SliderValueLabel <- tklabel(frame2)
tkgrid(tklabel(frame2,text=""),row=4, column=1)
tkconfigure(SliderValueLabel,textvariable=Breaks)
slider <- tkscale(frame2,command=replot.maybe,from=1, to=200,showvalue=TRUE, variable= Breaks,
                   resolution=1, orient="horizontal")
tkgrid(slider,row=4, column=0,sticky="ew")

tkgrid(tkradiobutton(frame2, text = "Sturges", value = nclass.Sturges(FPT), variable = Breaks,command=function(){.histtho_M1(Breaks=nclass.Sturges(FPT),Prob=TRUE,AjusGamma=TRUE)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Scott", value = nclass.scott(FPT), variable = Breaks,command=function(){.histtho_M1(Breaks=nclass.scott(FPT),Prob=TRUE,AjusGamma=TRUE)}), 
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "FD", value = nclass.FD(FPT), variable = Breaks,command=function(){.histtho_M1(Breaks=nclass.FD(FPT),Prob=TRUE,AjusGamma=TRUE)}),
        sticky = "ew")

tkgrid(tklabel(frame2,text = "Probability : "),sticky = "w")
tkgrid(tkradiobutton(frame2,text = "No",value="FALSE",variable = Prob),row=9,columnspan = 2)
tkgrid(tkradiobutton(frame2,text = "Yes",value="TRUE",variable = Prob),row=9,column=1)
tkgrid(frame2, rowspan = 7,row=10,column=0,padx=5,pady=5)

frame3 <- tkframe(tt, relief = "ridge", borderwidth = 6)
butbb <- tkbutton(frame3,text="Summary ?",command=function(){print(help("summary"))},width=10)
tkgrid(butbb,row=1,sticky = "ew")

txt <- tktext(frame3,width=21,height=5,bg="white")
tkgrid(txt)
tkinsert(txt,"end",.SUMMY(H=TRUE))
tkconfigure(txt, state="disabled")
tkfocus(txt)

tkgrid(tklabel(frame3,text = "Gamma Distribution : "),sticky = "w")
tkgrid(tkradiobutton(frame3,text = "No",value="FALSE",variable = AjusGamma),row=14,columnspan = 2)
tkgrid(tkradiobutton(frame3,text = "Yes",value="TRUE",variable = AjusGamma),row=14,column=1)

tkgrid(tklabel(frame3,text = "Empirical Distribution : "),sticky = "w")
tkgrid(tkradiobutton(frame3,text = "No",value="FALSE",variable = Fcnt,command=function(){.FCREP_M1(H=FALSE)}),row=17,columnspan = 2)
tkgrid(tkradiobutton(frame3,text = "Yes",value="TRUE",variable = Fcnt,command=function(){.FCREP_M1(H=TRUE)}),row=17,column=1)

tkgrid(frame3, rowspan = 7,row=10,column=1,padx=5,pady=5)

submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,q.but2,sticky="ew")
})
}

.KerFPT_M1GUI <- function()
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
tclvalue(FPT) <- FPT
##FPT <- tclVar()
y <- 1/FPT
xlim <- NULL
kernel<- tclVar("gaussian")
bw    <- tclVar(1)
bw.sav <- 1
AjusGamma <- tclVar("FALSE")

replot <- function(...) {
        if (is.null(y)) return() 
        bw.sav <<- b <- as.numeric(tclObj(bw))
        k  <- as.character(tclObj(kernel))
        eval(substitute(plot(density(y, bw=b, kernel=k),xlim=xlim,xlab=expression(tilde(tau[c])^(1)==1/tau[c]^(1)),main="",las=1)))
        mtext(bquote("Estimated Density of the (FPT)\nUsing The Kernel Method ": bolditalic(M[(list(s==1,sigma))])),line=2.1,adj=0.5,cex=0.9,col="black")
        mtext(bquote(Kernel== .(k)),line=1.1,adj=0,cex=0.9,col="red")
        mtext(bquote(Bandwidth== .(round(b,4))),line=0.25,adj=0,cex=0.9,col="red")
        mtext(bquote(N == .(length(y))),line=0.25,adj=0.5,cex=0.9,col="blue")
        mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sun Jan 09 11:20:21 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
    }

replot.maybe <- function(...)
    {
        if (as.numeric(tclObj(bw)) != bw.sav) replot()
    }

regen <- function(...) {
        xlim <<- range(y) + c(0,2)
        replot()
    }

GAMMA <- function(H=c("TRUE","FALSE"))
       {
        if (H==TRUE){
        replot()
        B <- (mean(y)^2/var(y))
        C <- mean(y)/var(y)
        ech <- seq(0,max(y)+10,length.out=1000)
        points(ech,dgamma(ech, shape=B, rate=C), type="l",col="blue",lwd=2)
        mtext(bquote("law" :Gamma(.(round(B,2)),.(round(C,2)))),adj=1,line=0.2,cex=1,col="blue")
        legend("topright",border="gray",c("Estimated Density","Gamma Law"),col=c("black","blue"),lwd=c(2,2),lty=c(1,1))
                   }
      }

base <- tktoplevel()
tkwm.title(base, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(base,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(base, Rico)
tk2ico.destroy(Rico)
but2 <- tkbutton(base,text="Estimated Density of the (FPT)?\n    Using The Kernel Method  \n              M (S=1,Sigma)",command=function(){print(help("plot.density"))},width=40)
tkgrid(but2,columnspan = 3,row=1)
tkpack(but2)
spec.frm <- tkframe(base,borderwidth=2)
left.frm <- tkframe(spec.frm,borderwidth=2)
right.frm <- tkframe(spec.frm,borderwidth=2)

frame1 <- tkframe(left.frm, relief="ridge", borderwidth=10)

tkpack(tkbutton(frame1, text="Kernel \n to be \n used?",command=function(){print(help("density"))}))
for ( i in c("gaussian", "epanechnikov", "rectangular",
                 "triangular","biweight", "cosine","optcosine") ) {
tmp <- tkradiobutton(frame1, command=replot,
                             text=i, value=i, variable=kernel)
tkpack(tmp, anchor="w")
    }

frame2 <-tkframe(right.frm, relief="ridge", borderwidth=10)
tkpack(tkbutton(frame2, text="Bandwidth ?",command=function(){print(help("bw.ucv"))}))
tkpack(tkscale(frame2, command=replot.maybe, from=0.05, to=5.00,
                   showvalue=FALSE, variable=bw,
                   resolution=0.05, orient="horiz"))
tkpack(tkradiobutton(frame2, text = "Implements a rule-of-thumb", value = bw.nrd0(y), variable = bw,command=replot.maybe),
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "Scott", value = bw.nrd(y), variable = bw,command=replot.maybe), 
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "unbiased cross-validation", value = bw.ucv(y), variable = bw ,command=replot.maybe),
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "Biased cross-validation", value = bw.bcv(y), variable = bw,command=replot.maybe), 
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "Sheather & Jones", value = bw.SJ(y), variable = bw ,command=replot.maybe),
        anchor = "w")

tkpack(tkbutton(frame2, text="Gamma Distribution ?",command=function(){print(help("rgamma"))}))
tkpack(tkradiobutton(frame2,text = "No",value="FALSE",variable = AjusGamma,command=function(){GAMMA(H=FALSE)}),anchor = "w")
tkpack(tkradiobutton(frame2,text = "Yes",value="TRUE",variable = AjusGamma,command=function(){GAMMA(H=TRUE)}),anchor = "w")


tkpack(frame1, frame2, fill="x")
tkpack(left.frm, right.frm,side="left", anchor="n")
q.but <- tkbutton(base,text="Quit",
                      command=function() tkdestroy(base))
tkpack(spec.frm,q.but)
regen()
})
}


.tesKS1GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but2 <- tkbutton(tt,text="Kolmogorov-Smirnov test?\n          M (S=1,Sigma)",command=function(){print(help("ks.test"))},width=40)
tkgrid(but2,row=1,columnspan = 3)

tclvalue(FPT) <- FPT
testKS <- function(H=c("TRUE","FALSE"))
       {
if (H==TRUE){
y <- 1/FPT
a <- mean(y)^2 /var(y)
b <- mean(y) /var(y)
res <- ks.test(y, "dgamma",a ,b )
paste("Kolmogorov-Smirnov test \n Density :","\n","Length =",length(y),"\n","statistic (D)= ",round(res$statistic,6),"\n","p.value =",round(res$p.value,6),
      "\n","Gamma Distribution:","\n","Shape =",round(a,6),"\n","Rate =",round(b,6))
}else{
y <- 1/FPT
a <- mean(y)^2 /var(y)
b <- mean(y) /var(y)
res <- ks.test(y, "pgamma",a ,b )
paste("Kolmogorov-Smirnov test \n Probability :","\n","Length =",length(y),"\n","statistic (D)= ",round(res$statistic,6),"\n","p.value =",round(res$p.value,6),
      "\n","Gamma Distribution:","\n","Shape =",round(a,6),"\n","Rate =",round(b,6))
}
}

frame1 <- tkframe(tt, relief = "ridge", borderwidth = 6)

txt <- tktext(frame1,width=30,height=7,bg="white")
tkgrid(txt)
tkinsert(txt,"end",paste(testKS(H=TRUE)))
tkconfigure(txt, state="disabled")
tkfocus(txt)
tkgrid(frame1, rowspan = 1,row=3,column=0,padx=5,pady=5)

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 6)

txt2 <- tktext(frame2,width=30,height=7,bg="white")
tkgrid(txt2)
tkinsert(txt2,"end",paste(testKS(H=FALSE)))
tkconfigure(txt2, state="disabled")
tkfocus(txt2)
tkgrid(frame2, rowspan = 1,row=3,column=1,padx=5,pady=5)

q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(q.but,columnspan = 3)
})
}

.SimFPT_M2GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="Simulation the First Passage Time (FPT)?\n                       M (S > 1,Sigma)",command=function(){print(help("tho_M2"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(1000)
M  <- tclVar(100)
T  <- tclVar(1)
t0 <- tclVar(0)
R0 <- tclVar(2)
v  <- tclVar(0.5)
s  <- tclVar(2)
K  <- tclVar(2)
Sigma <- tclVar(0.3)
Methods <- tclVar("Euler")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(M)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(R0)     <-""
         tclvalue(v)      <-""
         tclvalue(K)      <-""
		 tclvalue(s)      <-""
         tclvalue(Sigma)  <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 20)
M.entry       <- tkentry(tt, textvariable=M,width = 20)
t0.entry      <- tkentry(tt, textvariable=t0,width = 20)
T.entry       <- tkentry(tt, textvariable=T,width = 20)
R0.entry      <- tkentry(tt, textvariable=R0,width = 20)
v.entry       <- tkentry(tt, textvariable=v,width = 20)
K.entry       <- tkentry(tt, textvariable=K,width = 20)
s.entry       <- tkentry(tt, textvariable=s,width = 20)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 20)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
USTHB <- function(N,M,t0,v,T,R0,K,s,Sigma,Output,Methods) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         R0     <- as.numeric(tclObj(R0))
         v      <- as.numeric(tclObj(v))
         K      <- tclvalue(K)   
         s      <- tclvalue(s)		 
         Sigma  <- tclvalue(Sigma) 
         e1     <- try(parse(text=K))
         e2     <- try(parse(text=Sigma))
		 e3     <- try(parse(text=s))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
        eval(substitute(tho_M2(N=N,M=M,t0=t0,v=v,T=T,R0=R0,K=eval(e1),s=eval(e3),Sigma=eval(e2),Output=Output,Methods=Methods)))
}

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Size of FPT = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of FPT : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" R0 > threshold (Example threshold = 0.5).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="R0 > threshold (Example R0 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (R0) : "), R0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( 2*K > Sigma^2 ).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( s > 1 ).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="S : "), s.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( 2*K > Sigma^2 )",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")


frame1 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tklabel(frame1, text = "Methods"), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "Euler Scheme", value = "Euler", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Milstein Scheme", value = "Milstein", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Second Milstein Scheme", value = "MilsteinS", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Strong Ito-Taylor Scheme Order 1.5", value = "Ito-Taylor", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Heun Scheme", value =  "Heun", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Runge-Kutta Scheme Order3", value = "RK3", variable = Methods), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=12,columnspan=5,padx=5,pady=5)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB(N,M,t0,v,T,R0,K,s,Sigma,Output,Methods)})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})
}



.hist.FPT_M2GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but2 <- tkbutton(tt,text="Histograms for First Passage Time (FPT)?\n                       M (S > 1,Sigma)",command=function(){print(help("hist_meth"))},width=40)
tkgrid(but2,row=1,columnspan = 3,sticky="ew")
tclvalue(FPTT) <- FPTT

.histtho_M2 <-
function(Breaks,Prob = c("TRUE","FALSE"),AjusGamma=c("TRUE","FALSE"))
           {
if (length(dim(FPTT)) > 0) 
            stop(tkmessageBox(title="Error",message=paste( "No Simulated for FPT" ),icon="error"))
x <- seq(min(FPTT),max(FPTT),by=0.001)
if (Breaks=='Sturges')   {Breaks <- nclass.Sturges(FPTT)}
if (Breaks=='scott')     {Breaks <- nclass.scott(FPTT)}
if (Breaks=='FD')        {Breaks <- nclass.FD(FPTT)}

hist((1/FPTT),breaks = Breaks,probability = Prob,col="light blue",border="dark blue",
     xlab = expression(tilde(tau[c])^(s)==1/tau[c]^(s)),las=1,main="")
box()
mtext(expression("Histogram for the First Passage Time (FPT)": tilde(tau[c])^(s)),line=2.5,adj=0.5,cex=1,col="black")
mtext(bquote(nclass==.(Breaks)),adj=0,line=0.2,cex=1,col="blue")

if (AjusGamma == TRUE){
Y <- (1/FPTT)
B <- (mean(Y)^2/var(Y))
C <- mean(Y)/var(Y)
curve(dgamma(x,B,C), col = "red", lwd = 2, add = TRUE)
mtext(bquote("law" :Gamma(.(round(B,2)),.(round(C,2)))),adj=1,line=0.2,cex=1,col="red")
}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sun Jan 09 11:20:21 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

.SUMMY2 <- function(H=c("TRUE","FALSE"))
       {
if(H==TRUE){
paste("Summary :","\n","Length =",length(1/FPTT),"\n",
                         "Min =",round(min((1/FPTT)),4),"\n",
                         "Max =",round(max((1/FPTT)),4),"\n",
                         "Median =",round(median((1/FPTT)),4),"\n",
                         "Mean =",round(mean((1/FPTT)),4),"\n",
                         "Var =",round(var((1/FPTT)),4),"\n",
                         "sd =",round(sd((1/FPTT)),4),"\n",
                         "Gamma Distribution:","\n",
                         "Shape =",round((mean(1/FPTT)^2/var(1/FPTT)),4),"\n",
                         "Rate =",round(mean(1/FPTT)/var(1/FPTT),4))
}
}

.FCREP_M2 <-
function(H=c("TRUE","FALSE"))
       {
x <- seq(min(FPTT),max(FPTT),by=0.001)
if(H==TRUE){
X <- (1/FPTT)
n <- length(X)
y <- sort(X)
a = 0.4
f <- numeric()
for ( i in 1:n)
     {
     f[i] <- (i/n)
     }
plot(y,f,type="p",pch="*",las=1,xlab = expression(tilde(tau[c])^(s)==1/tau[c]^(s)),ylab="Frequence")
points(y,f,type="n",panel.frist=grid(col="gray"))
mtext(expression("Empirical Distribution for FPT": tilde(tau[c])^(s)),line=2.5,adj=0.5,cex=1,col="black")
a <- mean(y)^2/var(y)
b <- mean(y)/var(y)

curve(pgamma(x,a,b), col = "red", lwd = 2, add = TRUE,panel.first=grid(col="gray"))
mtext(bquote("law" :Gamma(.(round(a,2)),.(round(b,2)))),adj=0,line=0.2,cex=1,col="red")
legend("topleft",bg="gray85",border="gray",c("Empirical Distr","Gamma Law"),pch=c("*",""),col=c("black","red"),lwd=c("",2),lty=c(0,1))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sun Jan 09 11:20:21 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
}

Breaks    <- tclVar(nclass.Sturges(FPTT))
Prob      <- tclVar("TRUE")
AjusGamma <- tclVar("FALSE")
Fcnt      <- tclVar("FALSE")

Breaks.entry       <- tkentry(tt, textvariable=Breaks)
Prob.entry         <- tkentry(tt, textvariable=Prob)

USTHB2 <- function(...) 
        {
         Breaks <- as.numeric(tclObj(Breaks))
         Prob   <- as.character(tclObj(Prob))
         AjusGamma   <- as.character(tclObj(AjusGamma))
        eval(substitute(.histtho_M2(Breaks,Prob,AjusGamma)))
        }

    replot.maybe <- function(...)
    {
        if (as.numeric(tclObj(Breaks)) != nclass.Sturges(FPTT)) USTHB2()
    }

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 10)
butb <- tkbutton(frame2,text="histograms ?",command=function(){print(help("hist"))},width=10)
tkgrid(butb,row=2,sticky = "ew")

tkgrid(tklabel(frame2,text = "Numbre of classe : "),sticky = "w")
SliderValueLabel <- tklabel(frame2)
tkgrid(tklabel(frame2,text=""),row=4, column=1)
tkconfigure(SliderValueLabel,textvariable=Breaks)
slider <- tkscale(frame2,command=replot.maybe,from=1, to=200,showvalue=TRUE, variable= Breaks,
                   resolution=1, orient="horizontal")
tkgrid(slider,row=4, column=0,sticky="ew")

tkgrid(tkradiobutton(frame2, text = "Sturges", value = nclass.Sturges(FPTT), variable = Breaks,command=function(){.histtho_M2(Breaks=nclass.Sturges(FPTT),Prob=TRUE,AjusGamma=TRUE)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Scott", value = nclass.scott(FPTT), variable = Breaks,command=function(){.histtho_M2(Breaks=nclass.scott(FPTT),Prob=TRUE,AjusGamma=TRUE)}), 
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "FD", value = nclass.FD(FPTT), variable = Breaks,command=function(){.histtho_M2(Breaks=nclass.FD(FPTT),Prob=TRUE,AjusGamma=TRUE)}),
        sticky = "ew")

tkgrid(tklabel(frame2,text = "Probability : "),sticky = "w")
tkgrid(tkradiobutton(frame2,text = "No",value="FALSE",variable = Prob),row=9,columnspan = 2)
tkgrid(tkradiobutton(frame2,text = "Yes",value="TRUE",variable = Prob),row=9,column=1)
tkgrid(frame2, rowspan = 7,row=10,column=0,padx=5,pady=5)

frame3 <- tkframe(tt, relief = "ridge", borderwidth = 6)
butbb <- tkbutton(frame3,text="Summary ?",command=function(){print(help("summary"))},width=10)
tkgrid(butbb,row=1,sticky = "ew")

txt <- tktext(frame3,width=21,height=5,bg="white")
tkgrid(txt)
tkinsert(txt,"end",.SUMMY2(H=TRUE))
tkconfigure(txt, state="disabled")
tkfocus(txt)

tkgrid(tklabel(frame3,text = "Gamma Distribution : "),sticky = "w")
tkgrid(tkradiobutton(frame3,text = "No",value="FALSE",variable = AjusGamma),row=14,columnspan = 2)
tkgrid(tkradiobutton(frame3,text = "Yes",value="TRUE",variable = AjusGamma),row=14,column=1)

tkgrid(tklabel(frame3,text = "Empirical Distribution : "),sticky = "w")
tkgrid(tkradiobutton(frame3,text = "No",value="FALSE",variable = Fcnt,command=function(){.FCREP_M2(H=FALSE)}),row=17,columnspan = 2)
tkgrid(tkradiobutton(frame3,text = "Yes",value="TRUE",variable = Fcnt,command=function(){.FCREP_M2(H=TRUE)}),row=17,column=1)

tkgrid(frame3, rowspan = 7,row=10,column=1,padx=5,pady=5)

submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,q.but2,sticky="ew")
})
}

.KerFPT_M2GUI <- function()
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
tclvalue(FPTT) <- FPTT
y <- 1/FPTT
xlim <- NULL
kernel<- tclVar("gaussian")
bw    <- tclVar(1)
bw.sav <- 1
AjusGamma <- tclVar("FALSE")

replot <- function(...) {
        if (is.null(y)) return() 
        bw.sav <<- b <- as.numeric(tclObj(bw))
        k  <- as.character(tclObj(kernel))
        eval(substitute(plot(density(y, bw=b, kernel=k),xlim=xlim,xlab=expression(tilde(tau[c])^(s)==1/tau[c]^(s)),main="",las=1)))
        mtext(bquote("Estimated Density of the (FPT)\nUsing The Kernel Method ": bolditalic(M[(list(s>=2,sigma))])),line=2.1,adj=0.5,cex=0.9,col="black")
        mtext(bquote(Kernel== .(k)),line=1.1,adj=0,cex=0.9,col="red")
        mtext(bquote(Bandwidth== .(round(b,4))),line=0.25,adj=0,cex=0.9,col="red")
        mtext(bquote(N == .(length(y))),line=0.25,adj=0.5,cex=0.9,col="blue")
        mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Mon Jan 17 22:33:54 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
    }

replot.maybe <- function(...)
    {
        if (as.numeric(tclObj(bw)) != bw.sav) replot()
    }

regen <- function(...) {
        xlim <<- range(y) + c(0,2)
        replot()
    }

GAMMA2 <- function(H=c("TRUE","FALSE"))
       {
        if (H==TRUE){
        replot()
        B <- (mean(y)^2/var(y))
        C <- mean(y)/var(y)
        ech <- seq(0,max(y)+10,length.out=1000)
        points(ech,dgamma(ech, shape=B, rate=C), type="l",col="blue",lwd=2)
        mtext(bquote("law" :Gamma(.(round(B,2)),.(round(C,2)))),adj=1,line=0.2,cex=1,col="blue")
        legend("topright",border="gray",c("Estimated Density","Gamma Law"),col=c("black","blue"),lwd=c(2,2),lty=c(1,1))
                   }
      }


base <- tktoplevel()
tkwm.title(base, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(base,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(base, Rico)
tk2ico.destroy(Rico)
but2 <- tkbutton(base,text="Estimated Density of the (FPT)?\n    Using The Kernel Method  \n              M (S > 1,Sigma)",command=function(){print(help("plot.density"))},width=40)
tkgrid(but2,columnspan = 3,row=1)
tkpack(but2)
spec.frm <- tkframe(base,borderwidth=2)
left.frm <- tkframe(spec.frm,borderwidth=2)
right.frm <- tkframe(spec.frm,borderwidth=2)

frame1 <- tkframe(left.frm, relief="ridge", borderwidth=10)

tkpack(tkbutton(frame1, text="Kernel \n to be \n used?",command=function(){print(help("density"))}))
for ( i in c("gaussian", "epanechnikov", "rectangular",
                 "triangular","biweight", "cosine","optcosine") ) {
tmp <- tkradiobutton(frame1, command=replot,
                             text=i, value=i, variable=kernel)
tkpack(tmp, anchor="w")
    }

frame2 <-tkframe(right.frm, relief="ridge", borderwidth=10)
tkpack(tkbutton(frame2, text="Bandwidth ?",command=function(){print(help("bw.ucv"))}))
tkpack(tkscale(frame2, command=replot.maybe, from=0.05, to=5.00,
                   showvalue=FALSE, variable=bw,
                   resolution=0.05, orient="horiz"))
tkpack(tkradiobutton(frame2, text = "Implements a rule-of-thumb", value = bw.nrd0(y), variable = bw,command=replot.maybe),
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "Scott", value = bw.nrd(y), variable = bw,command=replot.maybe), 
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "unbiased cross-validation", value = bw.ucv(y), variable = bw ,command=replot.maybe),
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "Biased cross-validation", value = bw.bcv(y), variable = bw,command=replot.maybe), 
        anchor = "w")
tkpack(tkradiobutton(frame2, text = "Sheather & Jones", value = bw.SJ(y), variable = bw ,command=replot.maybe),
        anchor = "w")

tkpack(tkbutton(frame2, text="Gamma Distribution ?",command=function(){print(help("rgamma"))}))
tkpack(tkradiobutton(frame2,text = "No",value="FALSE",variable = AjusGamma,command=function(){GAMMA2(H=FALSE)}),anchor = "w")
tkpack(tkradiobutton(frame2,text = "Yes",value="TRUE",variable = AjusGamma,command=function(){GAMMA2(H=TRUE)}),anchor = "w")


tkpack(frame1, frame2, fill="x")
tkpack(left.frm, right.frm,side="left", anchor="n")
q.but <- tkbutton(base,text="Quit",
                      command=function() tkdestroy(base))
tkpack(spec.frm,q.but)
regen()
})
}

.tesKS2GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Models")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but2 <- tkbutton(tt,text="Kolmogorov-Smirnov test?\n          M (S > 1,Sigma)",command=function(){print(help("ks.test"))},width=40)
tkgrid(but2,row=1,columnspan = 3)

tclvalue(FPTT) <- FPTT
testKS <- function(H=c("TRUE","FALSE"))
       {
if (H==TRUE){
y <- 1/FPTT
a <- mean(y)^2 /var(y)
b <- mean(y) /var(y)
res <- ks.test(y, "dgamma",a ,b )
paste("Kolmogorov-Smirnov test \n Density :","\n","Length =",length(y),"\n","statistic (D)= ",round(res$statistic,6),"\n","p.value =",round(res$p.value,6),
      "\n","Gamma Distribution:","\n","Shape =",round(a,6),"\n","Rate =",round(b,6))
}else{
y <- 1/FPTT
a <- mean(y)^2 /var(y)
b <- mean(y) /var(y)
res <- ks.test(y, "pgamma",a ,b )
paste("Kolmogorov-Smirnov test \n Probability:","\n","Length =",length(y),"\n","statistic (D)= ",round(res$statistic,6),"\n","p.value =",round(res$p.value,6),
      "\n","Gamma Distribution:","\n","Shape =",round(a,6),"\n","Rate =",round(b,6))
}
}

frame1 <- tkframe(tt, relief = "ridge", borderwidth = 6)

txt <- tktext(frame1,width=30,height=7,bg="white")
tkgrid(txt)
tkinsert(txt,"end",paste(testKS(H=TRUE)))
tkconfigure(txt, state="disabled")
tkfocus(txt)
tkgrid(frame1, rowspan = 1,row=3,column=0,padx=5,pady=5)

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 6)

txt2 <- tktext(frame2,width=30,height=7,bg="white")
tkgrid(txt2)
tkinsert(txt2,"end",paste(testKS(H=FALSE)))
tkconfigure(txt2, state="disabled")
tkfocus(txt2)
tkgrid(frame2, rowspan = 1,row=3,column=1,padx=5,pady=5)

q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(q.but,columnspan = 3)
})
}

.RadialP_2GUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Model~~Radial Process")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Radial Process ?\nM(S > 1,Sigma)",command=function(){print(help("RadialP_2"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(1000)
T  <- tclVar(1)
t0 <- tclVar(0)
R0 <- tclVar(2)
Dt <- tclVar(0.001)
K  <- tclVar(2)
s  <- tclVar(2)
Sigma <- tclVar(0.3)
Methods <- tclVar("Euler")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(R0)     <-""
         tclvalue(Dt)     <-""
         tclvalue(K)      <-""
         tclvalue(s)      <-""
         tclvalue(Sigma)  <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 20)
t0.entry      <- tkentry(tt, textvariable=t0,width = 20)
T.entry       <- tkentry(tt, textvariable=T,width = 20)
R0.entry      <- tkentry(tt, textvariable=R0,width = 20)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 20)
K.entry       <- tkentry(tt, textvariable=K,width = 20)
s.entry       <- tkentry(tt, textvariable=s,width = 20)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 20)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         R0     <- as.numeric(tclObj(R0))
         Dt     <- as.numeric(tclObj(Dt))
         K      <- tclvalue(K)   
         s      <- tclvalue(s) 		 
         Sigma  <- tclvalue(Sigma) 
         e1     <- try(parse(text=K))
         e2     <- try(parse(text=Sigma))
	     e3     <- try(parse(text=s))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
        eval(substitute(RadialP_2(N=N,t0=t0,Dt=Dt,T=T,R0=R0,K=eval(e1),s=eval(e3),Sigma=eval(e2),Output=Output,Methods=Methods)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="R0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (R0) : "), R0.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive ( 2*K > Sigma^2 ).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive s > 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="S : "), s.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive( 2*K > Sigma^2 )",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")


frame1 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tklabel(frame1, text = "Methods"), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "Euler Scheme", value = "Euler", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Milstein Scheme", value = "Milstein", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Second Milstein Scheme", value = "MilsteinS", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Strong Ito-Taylor Scheme Order 1.5", value = "Ito-Taylor", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Heun Scheme", value =  "Heun", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Runge-Kutta Scheme Order3", value = "RK3", variable = Methods), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=10,columnspan=5,padx=5,pady=5)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=14,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=14,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.RadialP2D_2GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~2D Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Two-Dimensional Attractive Model?\n                 M (S > 1,Sigma)",command=function(){print(help("RadialP2D_2"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(1000)
T        <- tclVar(1)
t0       <- tclVar(0)
Dt       <- tclVar(0.001)
X0       <- tclVar(2)
Y0       <- tclVar(0.5)
v        <- tclVar(0.5)
K        <- tclVar(4)
s        <- tclVar(2)
Sigma    <- tclVar(0.4)
Output   <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(v)            <-"0.2"
         tclvalue(K)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)           <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y0)           <-""
         tclvalue(X0)           <-""
         tclvalue(Sigma)        <-""
         tclvalue(s)            <-""
         tclvalue(Output)       <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 22)
K.entry       <- tkentry(tt, textvariable=K,width = 22)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 22)
v.entry       <- tkentry(tt, textvariable=v,width = 22)
t0.entry      <- tkentry(tt, textvariable=t0,width = 22)
T.entry       <- tkentry(tt, textvariable=T,width = 22)
X0.entry      <- tkentry(tt, textvariable=X0,width = 22)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 22)
Y0.entry       <- tkentry(tt, textvariable=Y0,width = 22)
s.entry       <- tkentry(tt, textvariable=s,width = 22)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         s         <- as.numeric(tclObj(s))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         Dt        <- as.numeric(tclObj(Dt))
         X0        <- as.numeric(tclObj(X0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y0        <- as.numeric(tclObj(Y0)) 
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(RadialP2D_2(N,t0,Dt,T=1,X0,Y0,v,K,s,Sigma,Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="X0 =! 0 or Y0 =! 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="X0 =! 0 or Y0 =! 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y0) : "), Y0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" (X0^2) + (Y0^2) > threshold (Example threshold = 0.5).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (s > 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="S : "), s.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=12,column=1)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.RadialP2D_2PCGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~2D Polar Corrd")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="       Two-Dimensional Attractive Model?\n   Models(S > 1,Sigma) in Polar coordinates",command=function(){print(help("RadialP2D_2PC"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(1000)
T        <- tclVar(1)
t0       <- tclVar(0)
R0       <- tclVar(2)
ThetaMax <- tclVar(2*pi)
K        <- tclVar(2)
s        <- tclVar(2)
sigma    <- tclVar(0.5)
output   <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(K)            <-""
         tclvalue(s)            <-""
         tclvalue(T)            <-""
         tclvalue(t0)           <-""
         tclvalue(ThetaMax)     <-""
         tclvalue(R0)           <-""
         tclvalue(sigma)        <-""
         tclvalue(output)       <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 22)
K.entry       <- tkentry(tt, textvariable=K,width = 22)
t0.entry      <- tkentry(tt, textvariable=t0,width = 22)
T.entry       <- tkentry(tt, textvariable=T,width = 22)
R0.entry      <- tkentry(tt, textvariable=R0,width = 22)
sigma.entry   <- tkentry(tt, textvariable=sigma,width = 22)
s.entry       <- tkentry(tt, textvariable=s,width = 22)
ThetaMax.entry<- tkentry(tt, textvariable=ThetaMax,width = 22)
output.entry  <- tkentry(tt, textvariable=output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         s         <- as.numeric(tclObj(s))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         R0        <- as.numeric(tclObj(R0))
         sigma     <- as.numeric(tclObj(sigma))  
         ThetaMax  <- as.character(tclObj(ThetaMax)) 
         output    <- as.character(tclObj(output))
         e1        <- try(parse(text=ThetaMax))
        eval(substitute(RadialP2D_2PC(N=N,R0=R0,t0=t0,T=T,ThetaMax=eval(e1),K=K,s=s,sigma=sigma,output=output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example R0 = 1 (R0 > 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (R0) : "), R0.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example  theta = 2*pi.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Polar coordinates (theta) : "), ThetaMax.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive s > 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="S : "), s.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")
tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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

.RadialP3D_2GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~ 3D Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Three-Dimensional Attractive Model?\n                    M (S > 1,Sigma)",command=function(){print(help("RadialP3D_2"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(1000)
T        <- tclVar(1)
Dt       <- tclVar(0.001)
t0       <- tclVar(0)
X0       <- tclVar(1)
Y0       <- tclVar(0)
Z0       <- tclVar(-1)
v        <- tclVar(0.4)
K        <- tclVar(2)
s        <- tclVar(2)
Sigma    <- tclVar(0.5)
Output   <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(v)            <-"0.4"
         tclvalue(K)            <-""
         tclvalue(s)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)            <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y0)           <-""
         tclvalue(X0)           <-""
         tclvalue(Z0)           <-""
         tclvalue(Sigma)        <-""
         tclvalue(Output)       <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 30)
K.entry       <- tkentry(tt, textvariable=K,width = 30)
s.entry       <- tkentry(tt, textvariable=s,width = 30)
v.entry       <- tkentry(tt, textvariable=v,width = 30)
t0.entry      <- tkentry(tt, textvariable=t0,width = 30)
T.entry       <- tkentry(tt, textvariable=T,width = 30)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 30)
X0.entry      <- tkentry(tt, textvariable=X0,width = 30)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 30)
Y0.entry      <- tkentry(tt, textvariable=Y0,width = 30)
Z0.entry      <- tkentry(tt, textvariable=Z0,width = 30)
Output.entry  <- tkentry(tt, textvariable=Output)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         s         <- as.numeric(tclObj(s))
         t0        <- as.numeric(tclObj(t0))
         Dt        <- as.numeric(tclObj(Dt))
         T         <- as.numeric(tclObj(T))
         X0        <- as.numeric(tclObj(X0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y0        <- as.numeric(tclObj(Y0)) 
         Z0        <- as.numeric(tclObj(Z0))
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(RadialP3D_2(N,t0,Dt,T=1,X0,Y0,Z0,v,K,s,Sigma,Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X0 = 3.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y0) : "), Y0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Z0) : "), Z0.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" (X0^2) + (Y0^2) +(Z0^2) > threshold (Example threshold = 0.5).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="vonstant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive s > 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="S : "), s.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="vonstant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}




.ModAttractive <- function(A = 0)
           {
if ( A == 0 )  {.RadialP_1GUI()}
if ( A == 1 )  {.RadialP2D_1PCGUI()}
if ( A == 2 )  {.RadialP2D_1GUI()}
if ( A == 3 )  {.RadialP3D_1GUI()}

if ( A == 4 )  {.SimFPT_M1GUI()}
if ( A == 5 )  {.hist.FPT_M1GUI()}
if ( A == 6 )  {.KerFPT_M1GUI()}
if ( A == 7 )  {.tesKS1GUI()}

if ( A == 8 )   {.RadialP_2GUI()}
if ( A == 9 )   {.RadialP2D_2PCGUI()}
if ( A == 10 )  {.RadialP2D_2GUI()}
if ( A == 11 )  {.RadialP3D_2GUI()}

if ( A == 12 )  {.SimFPT_M2GUI()}
if ( A == 13 )  {.hist.FPT_M2GUI()}
if ( A == 14 )  {.KerFPT_M2GUI()}
if ( A == 15 )  {.tesKS2GUI()}
}



.ModAttractiveGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Diffusion Attractive Models")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

HLP <- function(){print(help("?"))}
HLP.but <- tkbutton(tt,text="    Diffusion Attractive Models ? \n First Case Model(S = 1, Sigma) ?",command=function(){print(help(RadialP_1))},width=80)
tkgrid(HLP.but,padx=5,pady=5,row=1,columnspan = 3)


A <- tclVar(0)
tkentry      <- ttkentry
A.entry      <- tkentry(tt, textvariable=A,width = 30)

USTHB <- function(...) 
        {
         if (is.null(A)) return()
         A      <- as.numeric(tclObj(A)) 
         eval(substitute(.ModAttractive(A)))
        }

frame1 <- tkframe(tt, relief = "ridge", borderwidth = 5)

tkgrid(tkradiobutton(frame1, text = "One-Dimensional Attractive Models \n   Models(S=1,Sigma)", value = 0, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Two-Dimensional Attractive Models \n   Models(S=1,Sigma) in Polar coordinates", value = 1, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Two-Dimensional Attractive Models \n   Models(S=1,Sigma)", value = 2, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Three-Dimensional Attractive Models \n   Models(S=1,Sigma)", value = 3, 
        variable = A), sticky = "w")
tkgrid(frame1, rowspan = 1,row=6,padx=5,pady=5)

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 5)

tkgrid(tkradiobutton(frame2, text = "1- Simulation of the First Passage Time (FPT)\n    using different methods ", value = 4, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "2- Estimated Density of the (FPT)\n    using The Histograms Method", value = 5, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "3- Estimated Density of the (FPT)\n    using The Kernel Method ", value = 6, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame2, text = "4- Kolmogorov-Smirnov test\n    for the Density Gamma ", value = 7, 
        variable = A), sticky = "w")

tkgrid(frame2, rowspan = 1,row=6,column=1,padx=5,pady=5)



HLP2 <- function(){print(help("?"))}
HLP2.but <- tkbutton(tt,text="       Diffusion Attractive Models ? \n Second Case Model(S > 1, Sigma) ?",command=function(){print(help(RadialP_2))},width=80)
tkgrid(HLP2.but,padx=5,pady=5,row=7,columnspan = 3)

frame3 <- tkframe(tt, relief = "ridge", borderwidth = 5)

tkgrid(tkradiobutton(frame3, text = "One-Dimensional Attractive Models \n   Models(S > 1,Sigma)", value = 8, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "Two-Dimensional Attractive Models \n   Models(S > 1,Sigma) in Polar coordinates", value = 9, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "Two-Dimensional Attractive Models \n   Models(S > 1,Sigma)", value = 10, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame3, text = "Three-Dimensional Attractive Models \n   Models(S > 1,Sigma)", value = 11, 
        variable = A), sticky = "w")

tkgrid(frame3, rowspan = 1,row=9,padx=5,pady=5)

frame4 <- tkframe(tt, relief = "ridge", borderwidth = 5)

tkgrid(tkradiobutton(frame4, text = "1- Simulation of the First Passage Time (FPT)\n    using different methods ", value = 12, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame4, text = "2- Estimated Density of the (FPT)\n    using The Histograms Method", value = 13, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame4, text = "3- Estimated Density of the (FPT)\n    using The Kernel Method ", value = 14, 
        variable = A), sticky = "w")
tkgrid(tkradiobutton(frame4, text = "4- Kolmogorov-Smirnov test\n    for the Density Gamma ", value = 15, 
        variable = A), sticky = "w")

tkgrid(frame4, rowspan = 1,row=9,column=1,padx=5,pady=5)

submit.but <- tkbutton(tt, text="Go!",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,q.but,sticky = "ew")
})   
}

.TowDiffAtra2DGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Model for 2-Diffusion Processes")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Two-Dimensional Attractive Model for Two-Diffusion Processes ? \n                      V(1)=(X(1),X(2)) and V(2)=(Y(1),Y(2))",command=function(){print(help("TowDiffAtra2D"))})
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(5000)
T        <- tclVar(1)
t0       <- tclVar(0)
Dt       <- tclVar(0.001)
X1_0     <- tclVar(2)
X2_0     <- tclVar(2)
Y1_0     <- tclVar(-0.5)
Y2_0     <- tclVar(-1)
v        <- tclVar(0.05)
K        <- tclVar(3)
m        <- tclVar(0.4)
Sigma    <- tclVar(0.4)
Output   <- tclVar("FALSE")

reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(v)            <-""
         tclvalue(K)            <-""
         tclvalue(m)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)           <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y1_0)         <-""
         tclvalue(Y2_0)         <-""
         tclvalue(X1_0)         <-""
         tclvalue(X2_0)         <-""
         tclvalue(Sigma)        <-""
         tclvalue(Output)       <-"FALSE"
         }

tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
K.entry       <- tkentry(tt, textvariable=K,width = 26)
m.entry       <- tkentry(tt, textvariable=m,width = 26)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 26)
v.entry       <- tkentry(tt, textvariable=v,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
X1_0.entry    <- tkentry(tt, textvariable=X1_0,width = 26)
X2_0.entry    <- tkentry(tt, textvariable=X2_0,width = 26)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 26)
Y1_0.entry    <- tkentry(tt, textvariable=Y1_0,width = 26)
Y2_0.entry    <- tkentry(tt, textvariable=Y2_0,width = 26)
Output.entry  <- tkentry(tt, textvariable=Output)

USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         m         <- as.numeric(tclObj(m))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         Dt        <- as.numeric(tclObj(Dt))
         X1_0      <- as.numeric(tclObj(X1_0))
         X2_0      <- as.numeric(tclObj(X2_0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y1_0      <- as.numeric(tclObj(Y1_0))
         Y2_0      <- as.numeric(tclObj(Y2_0)) 
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(TwoDiffAtra2D(N,t0,Dt,T=1,X1_0,X2_0,Y1_0,Y2_0,v,K,m,Sigma,Output)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X1_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X1_0) : "), X1_0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X2_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X2_0) : "), X2_0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y1_0 = 0.5.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y1_0) : "), Y1_0.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y2_0 = -1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y2_0) : "), Y2_0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" D=sqrt(V(1)^2 - V(2)^2) <= threshold \n Example threshold = 0.05 and D it is Distance between V(1) and V(2) .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (m > 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="m : "), m.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=14,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=14,column=1)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.TowDiffAtra3DGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Model for 2-Diffusion Processes")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Three-Dimensional Attractive Model for Two-Diffusion Processes ? \n                      V(1)=(X(1),X(2),X(3)) and V(2)=(Y(1),Y(2),Y(3))",command=function(){print(help("TowDiffAtra3D"))})
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(5000)
T        <- tclVar(1)
t0       <- tclVar(0)
Dt       <- tclVar(0.001)
X1_0     <- tclVar(2)
X2_0     <- tclVar(2)
X3_0     <- tclVar(2)
Y1_0     <- tclVar(-0.5)
Y2_0     <- tclVar(-1)
Y3_0     <- tclVar(0)
v        <- tclVar(0.05)
K        <- tclVar(3)
m        <- tclVar(0.4)
Sigma    <- tclVar(0.2)
Output   <- tclVar("FALSE")

reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(v)            <-""
         tclvalue(K)            <-""
         tclvalue(m)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)           <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y1_0)         <-""
         tclvalue(Y2_0)         <-""
         tclvalue(Y3_0)         <-""
         tclvalue(X1_0)         <-""
         tclvalue(X2_0)         <-""
         tclvalue(X3_0)         <-""
         tclvalue(Sigma)        <-""
         tclvalue(Output)       <-"FALSE"
         }

tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
K.entry       <- tkentry(tt, textvariable=K,width = 26)
m.entry       <- tkentry(tt, textvariable=m,width = 26)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 26)
v.entry       <- tkentry(tt, textvariable=v,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
X1_0.entry    <- tkentry(tt, textvariable=X1_0,width = 26)
X2_0.entry    <- tkentry(tt, textvariable=X2_0,width = 26)
X3_0.entry    <- tkentry(tt, textvariable=X3_0,width = 26)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 26)
Y1_0.entry    <- tkentry(tt, textvariable=Y1_0,width = 26)
Y2_0.entry    <- tkentry(tt, textvariable=Y2_0,width = 26)
Y3_0.entry    <- tkentry(tt, textvariable=Y3_0,width = 26)
Output.entry  <- tkentry(tt, textvariable=Output)

USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         K         <- as.numeric(tclObj(K))
         m         <- as.numeric(tclObj(m))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         Dt        <- as.numeric(tclObj(Dt))
         X1_0      <- as.numeric(tclObj(X1_0))
         X2_0      <- as.numeric(tclObj(X2_0))
         X3_0      <- as.numeric(tclObj(X3_0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y1_0      <- as.numeric(tclObj(Y1_0))
         Y2_0      <- as.numeric(tclObj(Y2_0)) 
         Y3_0      <- as.numeric(tclObj(Y3_0))
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(TwoDiffAtra3D(N,t0,Dt,T=1,X1_0,X2_0,X3_0,Y1_0,Y2_0,Y3_0,v,K,m,Sigma,Output)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X1_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X1_0) : "), X1_0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X2_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X2_0) : "), X2_0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X3_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X3_0) : "), X3_0.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y1_0 = 0.5.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y1_0) : "), Y1_0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y2_0 = -1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y2_0) : "), Y2_0.entry, sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y2_3 = 0.5.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y3_0) : "), Y3_0.entry, sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" D=sqrt(V(1)^2 - V(2)^2) <= threshold \n Example threshold = 0.05 and D it is Distance between V(1) and V(2) .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (m > 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="m : "), m.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=15, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.Euler2DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n                Euler Scheme ?\n Simulation SDE Two-Dimensional",command=function(){print(help("snssde2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.Euler2D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=12,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.Heun2DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n                Heun Scheme ?\n Simulation SDE Two-Dimensional",command=function(){print(help("snssde2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)    <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.Heun2D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=12,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.Milstein2DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n                Milstein Scheme ?\n Simulation SDE Two-Dimensional",command=function(){print(help("snssde2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.Milstein2D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=12,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.MilsteinS2DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n          Second Milstein Scheme ?\n Simulation SDE Two-Dimensional",command=function(){print(help("snssde2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.MilsteinS2D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=12,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PredCorr2D <-
function(N,T=1,t0,x0,y0,Dt,alpha=0.5,mu=0.5,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if ( alpha > 1 || alpha < 0 )
            stop(tkmessageBox(title="Error",message=paste( "0 <= alpha <= 1" ),icon="error"))

if ( mu > 1 || mu < 0 )
            stop(tkmessageBox(title="Error",message=paste( "0 <= mu <= 1" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))


DSx  <- D(diffx,"x")
Ax    <- function(t,x,y)  eval(driftx)
Sx    <- function(t,x,y)  eval(diffx)
Sxx   <- function(t,x,y)  eval(DSx)
SSx   <- function(t,x,y)  eval(driftx) - mu * eval(diffx) * eval(DSx)

DSy  <- D(diffy,"y")
Ay    <- function(t,x,y)  eval(drifty)
Sy    <- function(t,x,y)  eval(diffy)
Syy   <- function(t,x,y)  eval(DSy)
SSy   <- function(t,x,y)  eval(drifty) - mu * eval(diffy) * eval(DSy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
ux = runif(N,0,1)
ox = rep(1,N)
ox [ which(ux < 0.5) ] = -1
wx = cumsum(c(0,ox))*sqrt((T-t0)/N)
Dx    <- diff(wx)
uy = runif(N,0,1)
oy = rep(1,N)
oy [ which(uy < 0.5) ] = -1
wy = cumsum(c(0,oy))*sqrt((T-t0)/N)
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
XX    <- numeric()
YY    <- numeric()
X[1] <- XX[1] <- x0
Y[1] <- YY[1] <- y0
for (i in 2:(N+1)){
XX[i] = XX[i-1] + Ax(t[i-1],XX[i-1],YY[i-1])*Dt + Sx(t[i-1],XX[i-1],YY[i-1])*Dx[i-1]
YY[i] = YY[i-1] + Ay(t[i-1],XX[i-1],YY[i-1])*Dt + Sy(t[i-1],XX[i-1],YY[i-1])*Dy[i-1]
}

for (i in 2:(N+1)){
X[i] = X[i-1] +(alpha*SSx(t[i],XX[i],YY[i])+(1-alpha)*SSx(t[i-1],X[i-1],Y[i-1]))*Dt+
       (mu*Sx(t[i],XX[i],YY[i])+(1-mu)*Sx(t[i-1],X[i-1],Y[i-1]))*Dx[i-1]
Y[i] = Y[i-1] +(alpha*SSy(t[i],XX[i],YY[i])+(1-alpha)*SSy(t[i-1],X[i-1],Y[i-1]))*Dt+
       (mu*Sy(t[i],XX[i],YY[i])+(1-mu)*Sy(t[i-1],X[i-1],Y[i-1]))*Dy[i-1]
} 
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
if(Step==FALSE){points(X,Y,type="l",lwd=1,col="black",panel.frist=grid(col="gray"))}
if(Step==TRUE){for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1,panel.frist=grid(col="gray"))}}
mtext(expression("Predictor-Corrector Method: Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",bg="gray85",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "PredCorr2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}


.PredCorr2DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n      Predictor-Corrector Method ?\n Simulation SDE Two-Dimensional",command=function(){print(help("PredCorr2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
alpha <- tclVar(0.5)
mu    <- tclVar(0.5)
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(alpha)   <-"0.5"
         tclvalue(mu)      <-"0.5"
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)    <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
alpha.entry    <- tkentry(tt, textvariable=alpha)
mu.entry       <- tkentry(tt, textvariable=mu)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         alpha  <- as.numeric(tclObj(alpha))
         mu     <- as.numeric(tclObj(mu))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(PredCorr2D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,alpha=alpha,mu=mu,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

##DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Weight Alpha of the predictor-corrector scheme. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text = "Alpha : "),sticky = "w")
SliderValueLabel <- tklabel(tt)
##tkgrid(tklabel(tt,text=""),row=7, column=1)
tkconfigure(SliderValueLabel,textvariable=alpha)
slider <- tkscale(tt,from=0, to=1,showvalue=TRUE, variable=alpha,
                   resolution=0.01, orient="horizontal")
tkgrid(slider,row=7, column = 1,sticky="ew")
##tkgrid(DimHlp.but, row=7, column=2,sticky="w")

##DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Weight Mu of the predictor-corrector scheme.  ",icon="info",type="ok"))
tkgrid(tklabel(tt,text = "Mu : "),sticky = "w")
SliderValueLabel1 <- tklabel(tt)
##tkgrid(tklabel(tt,text=""),row=8, column=1)
tkconfigure(SliderValueLabel1,textvariable=mu)
slider1 <- tkscale(tt,from=0, to=1,showvalue=TRUE, variable=mu,
                   resolution=0.01, orient="horizontal")
tkgrid(slider1,row=8, column = 1,sticky="ew")
##tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=14,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=14,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=15,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}



.RK32DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n            Runge-Kutta Scheme ?\n Simulation SDE Two-Dimensional",command=function(){print(help("snssde2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)    <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.RK32D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=12,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.STS2DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n  Strong Taylor Scheme Order 1.5 ?\n Simulation SDE Two-Dimensional",command=function(){print(help("snssde2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.STS2D(N=N,t0=t0,T=1,x0=x0,y0=y0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),diffx=eval(e2),diffy=eval(e4),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of three variables t and x and y, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=12,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=12,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=13,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=13,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Ker_meth_GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but2 <- tkbutton(tt,text="                        Statistical Analysis \n Estimated Density of the Random Variable X?\n                Using The Kernel Method",command=function(){print(help("Kern_meth"))},width=35)
tkgrid(but2,columnspan = 3,row=1,sticky="ew")

DATA <- rnorm(1000)
dat <- tclVar("DATA")
bw  <- tclVar(0.25)
k   <- tclVar("gaussian")
bw.sav <- 1

dat.entry      <- tkentry(tt, textvariable=dat,width = 20)
bw.entry       <- tkentry(tt, textvariable=bw)
k.entry        <- tkentry(tt, textvariable=k)

reset <- function()
        {
         tclvalue(dat)      <-""
        }
USTHB2 <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         bw      <- as.numeric(tclObj(bw))
         k    <- as.character(tclObj(k))
         e1      <- try(parse(text=dat))
        eval(substitute(Kern_meth(X=eval(e1),bw,k)))
        }

    replot.maybe <- function(...)
    {
        dat     <- as.character(tclObj(dat))
        e1      <- try(parse(text=dat)) 
        if (as.numeric(tclObj(bw)) != bw.sav) USTHB2()
    }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data.(Example names = DATA or names = eval(rexp(1000,1)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=1,sticky="e")


frame1 <- tkframe(tt, relief="ridge", borderwidth=5)

tkgrid(tkbutton(frame1, text="Kernel?",command=function(){print(help("density"))}))
for ( i in c("gaussian", "epanechnikov", "rectangular",
                 "triangular","biweight", "cosine","optcosine") ) {
tmp <- tkradiobutton(frame1,text=i, value=i, variable=k)
tkgrid(tmp, sticky="w")
    }

tkgrid(frame1, rowspan = 1,row=3,column=0,padx=5,pady=5)


frame2 <-tkframe(tt, relief="ridge", borderwidth=14)
tkgrid(tkbutton(frame2, text="Bandwidth ?",command=function(){print(help("bw.ucv"))}))
tkgrid(tkscale(frame2,command=replot.maybe ,from=0.01, to=10.00,
                   showvalue=FALSE, variable=bw,
                   resolution=0.02, orient="horiz"))

UA1 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.nrd0(eval(e1))))
       }     
UA2 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.nrd(eval(e1))))
       }     
UA3 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.ucv(eval(e1))))
       }  
UA4 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.bcv(eval(e1))))
       }  
UA5 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.SJ(eval(e1))))
       }  
tkgrid(tkradiobutton(frame2, text = "Rule-of-thumb",value = UA1(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.nrd0(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Scott",value = UA2(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.nrd(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Unbiased cross-validation",value = UA3(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.ucv(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Biased cross-validation",value = UA4(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.bcv(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Sheather & Jones",value = UA5(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.SJ(eval(e1)),k)}),
        sticky = "ew")
tkgrid(frame2, rowspan = 1,row=3,column=1,padx=5,pady=5)


reset.but   <- tkbutton(tt, text="Reset", command=reset)
submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,q.but2)
})
}

.AjdexpGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="         Statistical Analysis \n The Exponential Distribution",command=function(){print(help("Ajdexp"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rexp(100,2)
dat  <- tclVar("DATA")
lambda <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(lambda)    <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
lambda.entry   <- tkentry(tt, textvariable=lambda,width = 30)
leve.entry     <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         lambda   <- as.numeric(tclObj(lambda))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdexp(X=eval(e1),starts = list(lambda=lambda),leve=leve)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example lambda = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="lambda : "), lambda.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.AjdgammaGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="       Statistical Analysis \n The Gamma Distribution",command=function(){print(help("Ajdgamma"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rgamma(100,2,1)
dat  <- tclVar("DATA")
shape <- tclVar(1)
rate <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)      <-""
         tclvalue(shape)     <-""
         tclvalue(rate)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
shape.entry   <- tkentry(tt, textvariable=shape,width = 30)
rate.entry   <- tkentry(tt, textvariable=rate,width = 30)
leve.entry    <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         shape   <- as.numeric(tclObj(shape))
         rate    <- as.numeric(tclObj(rate))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdgamma(X=eval(e1),starts = list(shape =shape, rate=rate),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example shape = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape : "), shape.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example rate = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Rate : "), rate.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdchisqGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="         Statistical Analysis \n The Chi-Squared Distribution",command=function(){print(help("Ajdchisq"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rchisq(100,15)
dat  <- tclVar("DATA")
df <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(df)        <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
df.entry       <- tkentry(tt, textvariable=df,width = 30)
leve.entry     <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         df      <- as.numeric(tclObj(df))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdchisq(X=eval(e1),starts = list(df=df),leve=leve)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer(degrees of freedom (non-negative, but can be non-integer).).(Example df = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom : "), df.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdbetaGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="       Statistical Analysis \n The Beta Distribution",command=function(){print(help("Ajdbeta"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rbeta(100,1,1)
dat  <- tclVar("DATA")
shape1 <- tclVar(1)
shape2 <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(shape1)    <-""
         tclvalue(shape2)    <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
shape1.entry   <- tkentry(tt, textvariable=shape1,width = 30)
shape2.entry   <- tkentry(tt, textvariable=shape2,width = 30)
leve.entry     <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         shape1  <- as.numeric(tclObj(shape1))
         shape2  <- as.numeric(tclObj(shape2))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdbeta(X=eval(e1),starts = list(shape1 =shape1, shape2=shape2),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example shape1 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape 1 : "), shape1.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example shape2 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape 2 : "), shape2.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdfGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Statistical Analysis \n The F Distribution",command=function(){print(help("Ajdf"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rf(100,2,1)
dat  <- tclVar("DATA")
df1 <- tclVar(1)
df2 <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)      <-""
         tclvalue(df1)      <-""
         tclvalue(df2)      <-""
         tclvalue(leve)     <-"0.95"
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
df1.entry      <- tkentry(tt, textvariable=df1,width = 30)
df2.entry      <- tkentry(tt, textvariable=df2,width = 30)
leve.entry     <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         df1     <- as.numeric(tclObj(df1))
         df2     <- as.numeric(tclObj(df2))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdf(X=eval(e1),starts = list(df1 =df1, df2=df2),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer(degrees of freedom (non-negative, but can be non-integer).).(Example df1 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom  1 : "), df1.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer(degrees of freedom (non-negative, but can be non-integer).).(Example df2 = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom  2 : "), df2.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdtGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="       Statistical Analysis \n The Student Distribution",command=function(){print(help("Ajdt"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rt(1000,2)
dat  <- tclVar("DATA")
df <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(df)        <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
df.entry       <- tkentry(tt, textvariable=df,width = 30)
leve.entry     <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         df      <- as.numeric(tclObj(df))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdt(X=eval(e1),starts = list(df=df),leve=leve)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer(degrees of freedom (non-negative, but can be non-integer).).(Example df = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom : "), df.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdweibullGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="       Statistical Analysis \n The Weibull Distribution",command=function(){print(help("Ajdweibull"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <-  rweibull(1000,2,0.5)
dat   <- tclVar("DATA")
shape <- tclVar(1)
scale <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(shape)     <-""
         tclvalue(scale)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
shape.entry   <- tkentry(tt, textvariable=shape,width = 30)
scale.entry   <- tkentry(tt, textvariable=scale,width = 30)
leve.entry    <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         shape   <- as.numeric(tclObj(shape))
         scale    <- as.numeric(tclObj(scale))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdweibull(X=eval(e1),starts = list(shape =shape, scale=scale),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example shape = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape : "), shape.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example scale = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Scale : "), scale.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdnormGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="       Statistical Analysis \n The Normal Distribution",command=function(){print(help("Ajdnorm"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <-  rnorm(1000,2,0.5)
dat   <- tclVar("DATA")
mean <- tclVar(1)
sd <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(mean)      <-""
         tclvalue(sd)        <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
mean.entry   <- tkentry(tt, textvariable=mean,width = 30)
sd.entry   <- tkentry(tt, textvariable=sd,width = 30)
leve.entry    <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         mean   <- as.numeric(tclObj(mean))
         sd    <- as.numeric(tclObj(sd))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute( Ajdnorm(X=eval(e1),starts = list(mean =mean, sd=sd),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example mean = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mean : "), mean.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example sd = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sd : "), sd.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AjdlognormGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="          Statistical Analysis \n The Log Normal Distribution",command=function(){print(help("Ajdlognorm"))})
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <-  rlnorm(1000,2,0.5)
dat   <- tclVar("DATA")
meanlog <- tclVar(1)
sdlog <- tclVar(1)
leve  <- tclVar(0.95)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(meanlog)     <-""
         tclvalue(sdlog)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
meanlog.entry   <- tkentry(tt, textvariable=meanlog,width = 30)
sdlog.entry   <- tkentry(tt, textvariable=sdlog,width = 30)
leve.entry    <- tkentry(tt, textvariable=leve,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         meanlog   <- as.numeric(tclObj(meanlog))
         sdlog    <- as.numeric(tclObj(sdlog))
         leve    <- as.numeric(tclObj(leve))
         e1      <- try(parse(text=dat))
         eval(substitute(Ajdlognorm(X=eval(e1),starts = list(meanlog =meanlog, sdlog=sdlog),leve=leve)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example meanlog = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Meanlog : "), meanlog.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Initial values for optimizer.(Example sdlog = 1).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sdlog : "), sdlog.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="The confidence level required(0 <= Level < 1).(Example Level = 0.95).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Level : "), leve.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.fctrep_Meth_GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but2 <- tkbutton(tt,text="                          Statistical Analysis \nEmpirical Distribution for the Random Variable X?",command=function(){print(help("fctrep_Meth"))},width=44)
tkgrid(but2,row=1,columnspan = 3,sticky="ew")

DATA <-  rlnorm(1000,2,0.5)
dat   <- tclVar("DATA")
dat.entry          <- tkentry(tt, textvariable=dat,width = 30)
reset <- function()
        {
         tclvalue(dat)      <-""
        }
USTHB2 <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         e1      <- try(parse(text=dat))
         eval(substitute(fctrep_Meth(X=eval(e1))))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector) or (eval(rlnorm(1000,2,0.5)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")
reset.but   <- tkbutton(tt, text="Reset", command=reset)
submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,reset.but,q.but2,sticky="w",columnspan=1)
})
}

.hist_methGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but2 <- tkbutton(tt,text="               Statistical Analysis \nHistogram for the Random Variable X?",command=function(){print(help("hist_meth"))},width=44)
tkgrid(but2,row=1,columnspan = 3,sticky="ew")

DATA <-  rlnorm(1000,2,0.5)
dat   <- tclVar("DATA")
dat                <- tclVar("DATA")
Breaks             <- tclVar(8)
Prob               <- tclVar("TRUE")


dat.entry          <- tkentry(tt, textvariable=dat,width = 20)
Breaks.entry       <- tkentry(tt, textvariable=Breaks)
Prob.entry         <- tkentry(tt, textvariable=Prob)

reset <- function()
        {
         tclvalue(dat)      <-""
        }

USTHB2 <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         Breaks  <- as.numeric(tclObj(Breaks))
         Prob    <- as.character(tclObj(Prob))
         e1      <- try(parse(text=dat))
        eval(substitute(hist_meth(X=eval(e1),Breaks,Prob)))
        }
UA1 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(nclass.Sturges(eval(e1))))
       }     
UA2 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(nclass.scott(eval(e1))))
       }     
UA3 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(nclass.FD(eval(e1))))
       }     

    replot.maybe <- function(...)
    {
        dat     <- as.character(tclObj(dat))
        e1      <- try(parse(text=dat)) 
        if (as.numeric(tclObj(Breaks)) != nclass.Sturges(eval(e1))) USTHB2()
    }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (data is a numeric vector) or (eval(rlnorm(1000,2,0.5)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 5)

tkgrid(tklabel(frame2,text = "Numbre of classe : "),sticky = "w")
SliderValueLabel <- tklabel(frame2)
tkgrid(tklabel(frame2,text=""),row=5, column=1)
tkconfigure(SliderValueLabel,textvariable=Breaks)
slider <- tkscale(frame2,command=replot.maybe,from=1, to=200,showvalue=FALSE, variable= Breaks,
                   resolution=1, orient="horizontal")
tkgrid(slider,row=5, column=0,sticky="ew")

tkgrid(tkradiobutton(frame2, text = "Sturges",value = UA1(), variable = Breaks,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          Prob    <- as.character(tclObj(Prob))
                          hist_meth(X=eval(e1),Breaks=nclass.Sturges(eval(e1)),Prob)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Scott",value = UA2(),variable = Breaks,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          Prob    <- as.character(tclObj(Prob))
                          hist_meth(X=eval(e1),Breaks=nclass.scott(eval(e1)),Prob)}), 
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "FD", value = UA3(),variable = Breaks,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          Prob    <- as.character(tclObj(Prob))
                          hist_meth(X=eval(e1),Breaks=nclass.FD(eval(e1)),Prob)}),
        sticky = "ew")
tkgrid(tklabel(frame2,text = "Probability : "),sticky = "w")
tkgrid(tkradiobutton(frame2,text = "No",value="FALSE",variable = Prob),row=12,columnspan = 2)
tkgrid(tkradiobutton(frame2,text = "Yes",value="TRUE",variable = Prob),row=12,column=1)
tkgrid(frame2, rowspan = 1,row=3,columnspan=5,padx=5,pady=5)

reset.but   <- tkbutton(tt, text="Reset", command=reset)
submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(reset.but,q.but2,sticky="e",columnspan=2)
})
}

.Ker_meth_GUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but2 <- tkbutton(tt,text="                        Statistical Analysis \n Estimated Density of the Random Variable X?\n                Using The Kernel Method",command=function(){print(help("Kern_meth"))},width=35)
tkgrid(but2,columnspan = 3,row=1,sticky="ew")

DATA <- rnorm(1000)
dat <- tclVar("DATA")
bw  <- tclVar(0.25)
k   <- tclVar("gaussian")
bw.sav <- 1

dat.entry      <- tkentry(tt, textvariable=dat,width = 20)
bw.entry       <- tkentry(tt, textvariable=bw)
k.entry        <- tkentry(tt, textvariable=k)

reset <- function()
        {
         tclvalue(dat)      <-""
        }
USTHB2 <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         bw      <- as.numeric(tclObj(bw))
         k    <- as.character(tclObj(k))
         e1      <- try(parse(text=dat))
        eval(substitute(Kern_meth(X=eval(e1),bw,k)))
        }

    replot.maybe <- function(...)
    {
        dat     <- as.character(tclObj(dat))
        e1      <- try(parse(text=dat)) 
        if (as.numeric(tclObj(bw)) != bw.sav) USTHB2()
    }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data.(Example names = DATA or names = eval(rexp(1000,1)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=1,sticky="e")


frame1 <- tkframe(tt, relief="ridge", borderwidth=5)

tkgrid(tkbutton(frame1, text="Kernel?",command=function(){print(help("density"))}))
for ( i in c("gaussian", "epanechnikov", "rectangular",
                 "triangular","biweight", "cosine","optcosine") ) {
tmp <- tkradiobutton(frame1,text=i, value=i, variable=k)
tkgrid(tmp, sticky="w")
    }

tkgrid(frame1, rowspan = 1,row=3,column=0,padx=5,pady=5)


frame2 <-tkframe(tt, relief="ridge", borderwidth=14)
tkgrid(tkbutton(frame2, text="Bandwidth ?",command=function(){print(help("bw.ucv"))}))
tkgrid(tkscale(frame2,command=replot.maybe ,from=0.01, to=10.00,
                   showvalue=FALSE, variable=bw,
                   resolution=0.02, orient="horiz"))

UA1 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.nrd0(eval(e1))))
       }     
UA2 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.nrd(eval(e1))))
       }     
UA3 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.ucv(eval(e1))))
       }  
UA4 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.bcv(eval(e1))))
       }  
UA5 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.SJ(eval(e1))))
       }  
tkgrid(tkradiobutton(frame2, text = "Rule-of-thumb",value = UA1(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.nrd0(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Scott",value = UA2(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.nrd(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Unbiased cross-validation",value = UA3(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.ucv(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Biased cross-validation",value = UA4(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.bcv(eval(e1)),k)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Sheather & Jones",value = UA5(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Kern_meth(X=eval(e1),bw=bw.SJ(eval(e1)),k)}),
        sticky = "ew")
tkgrid(frame2, rowspan = 1,row=3,column=1,padx=5,pady=5)


reset.but   <- tkbutton(tt, text="Reset", command=reset)
submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,q.but2)
})
}

.AnaSimFPTGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="                              Statistical Analysis \nSimulation M-Samples of First Passage Time (tau)",command=function(){print(help("AnaSimFPT"))},width=50)
tkgrid(but,row=1,columnspan = 3,sticky="ew")


N       <- tclVar(1000)
M       <- tclVar(50)
T       <- tclVar(1)
t0      <- tclVar(0)
X0      <- tclVar(2)
VXT     <- tclVar(0.8)
Dt      <- tclVar(0.001)
drift   <- tclVar("expression((-4*x))")
diff    <- tclVar("expression((0.5))")
Methods <- tclVar("Euler")
ELNA    <- tclVar("No")
Output  <- tclVar("FALSE")

reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(M)       <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(X0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(VXT)     <-""
         tclvalue(drift)   <-"expression((     ))"
         tclvalue(diff)    <-"expression((     ))"
         tclvalue(Output)  <-"FALSE"
         tclvalue(ELNA)    <-"No"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 23)
M.entry       <- tkentry(tt, textvariable=M,width = 23)
t0.entry      <- tkentry(tt, textvariable=t0,width = 23)
T.entry       <- tkentry(tt, textvariable=T,width = 23)
VXT.entry     <- tkentry(tt, textvariable=VXT,width = 23)
X0.entry      <- tkentry(tt, textvariable=X0,width = 23)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 23)
drift.entry   <- tkentry(tt, textvariable=drift,width = 23)
diff.entry    <- tkentry(tt, textvariable=diff,width = 23)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
ELNA.entry    <- tkentry(tt, textvariable=ELNA)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         X0     <- as.numeric(tclObj(X0))
         Dt     <- as.numeric(tclObj(Dt))
         VXT    <- as.numeric(tclObj(VXT))
         drift  <- tclvalue(drift)      
         diff   <- tclvalue(diff) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=diff))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
         ELNA   <- as.character(tclObj(ELNA))
        eval(substitute(AnaSimFPT(N,M,t0,Dt,T,X0,v=VXT,eval(e1),eval(e2),ELNA,Output,Methods)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Number of trajectories M must be >= 30 \n length(M) of first time passege must be >= 30.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="X0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" Exmaple X(v(t)) = 0.05 ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), VXT.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression(-2*x)).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression(0.5)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), diff.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Eliminate the cases NA : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No Replaced",value="No",variable = ELNA),row=11,column = 1,sticky="w")
tkgrid(tkradiobutton(tt,text = "Eliminate",value="Yes",variable = ELNA),row=12,column=1,sticky="w")
tkgrid(tkradiobutton(tt,text = "Replaced by Mean",value="Mean",variable = ELNA),row=13,column = 1,sticky="w")
tkgrid(tkradiobutton(tt,text = "Replaced by Median",value="Median",variable = ELNA),row=14,column=1,sticky="w")


tkgrid(tklabel(tt, text = "Numerical Methods :"), sticky = "w")
tkgrid(tkradiobutton(tt, text = "Euler Scheme", value = "Euler", variable = Methods),
        row=16,column = 1,sticky = "w")
tkgrid(tkradiobutton(tt, text = "Milstein Scheme", value = "Milstein", variable = Methods), 
        row=17,column = 1,sticky = "w")
tkgrid(tkradiobutton(tt, text = "Second Milstein \nScheme", value = "MilsteinS", variable = Methods),
        row=18,column = 1,sticky = "w")
tkgrid(tkradiobutton(tt, text = "Strong Ito-Taylor \nScheme Order 1.5", value = "Ito-Taylor", variable = Methods), 
        row=19,column = 1,sticky = "w")
tkgrid(tkradiobutton(tt, text = "Heun Scheme", value =  "Heun", variable = Methods), 
        row=20,column = 1,sticky = "w")
tkgrid(tkradiobutton(tt, text = "Runge-Kutta \nScheme Order3", value = "RK3", variable = Methods), 
        row=21,column = 1,sticky = "w")


tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=22,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=22,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.AnaSimXGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="                              Statistical Analysis \nSimulation M-Samples of Random Variable X(v[t])",command=function(){print(help("AnaSimX"))},width=50)
tkgrid(but,row=1,columnspan = 3,sticky="ew")


N       <- tclVar(1000)
M       <- tclVar(50)
T       <- tclVar(1)
t0      <- tclVar(0)
X0      <- tclVar(2)
VXT     <- tclVar(0.8)
Dt      <- tclVar(0.001)
drift   <- tclVar("expression((-4*x))")
diff    <- tclVar("expression((0.5))")
Methods <- tclVar("Euler")
Output  <- tclVar("FALSE")

reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(M)       <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(X0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(VXT)     <-""
         tclvalue(drift)   <-"expression((     ))"
         tclvalue(diff)    <-"expression((     ))"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 25)
M.entry       <- tkentry(tt, textvariable=M,width = 25)
t0.entry      <- tkentry(tt, textvariable=t0,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
VXT.entry     <- tkentry(tt, textvariable=VXT,width = 25)
X0.entry      <- tkentry(tt, textvariable=X0,width = 25)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 25)
drift.entry   <- tkentry(tt, textvariable=drift,width = 25)
diff.entry    <- tkentry(tt, textvariable=diff,width = 25)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))
         M      <- as.numeric(tclObj(M))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         X0     <- as.numeric(tclObj(X0))
         Dt     <- as.numeric(tclObj(Dt))
         VXT    <- as.numeric(tclObj(VXT))
         drift  <- tclvalue(drift)      
         diff   <- tclvalue(diff) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=diff))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
        eval(substitute(AnaSimX(N,M,t0,Dt,T,X0,v=VXT,eval(e1),eval(e2),Output,Methods)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Number of trajectories M must be >= 30 \n length(M) of first time passege must be >= 30.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Number of trajectories (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="X0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="v(t) = k *Dt ,with k integer (1 <= k <= N)\n example : k =800 in [1,N=1000] ==> v = 800* 0.001 = 0.8  ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Moment v[t] : "), VXT.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression(-2*x)).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression(0.5)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), diff.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")


frame1 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tklabel(frame1, text = "Methods"), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "Euler Scheme", value = "Euler", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Milstein Scheme", value = "Milstein", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Second Milstein Scheme", value = "MilsteinS", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Strong Ito-Taylor Scheme Order 1.5", value = "Ito-Taylor", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Heun Scheme", value =  "Heun", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Runge-Kutta Scheme Order3", value = "RK3", variable = Methods), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=12,columnspan=5,padx=5,pady=5)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dexpGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="         Statistical Analysis \n Kolmogorov-Smirnov Tests \nThe Exponential Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rexp(100,2)
dat  <- tclVar("DATA")
lambda <- tclVar(2)

reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(lambda)    <-""
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
lambda.entry   <- tkentry(tt, textvariable=lambda,width = 30)

USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         lambda   <- as.numeric(tclObj(lambda))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dexp(X=eval(e1),lambda=lambda)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="lambda : "), lambda.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})
}

.test_ks_dgammaGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="         Statistical Analysis \n Kolmogorov-Smirnov Tests \n   The Gamma Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA  <- rgamma(100,2,1)
dat   <- tclVar("DATA")
shape <- tclVar(2)
rate  <- tclVar(1)

reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(shape)     <-""
         tclvalue(rate)      <-""
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
shape.entry   <- tkentry(tt, textvariable=shape,width = 30)
rate.entry   <- tkentry(tt, textvariable=rate,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         shape   <- as.numeric(tclObj(shape))
         rate    <- as.numeric(tclObj(rate))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dgamma(X=eval(e1),shape =shape, rate=rate)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape : "), shape.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Rate : "), rate.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}
.test_ks_dchisqGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="         Statistical Analysis \n Kolmogorov-Smirnov Tests\nThe Chi-Squared Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rchisq(100,15)
dat  <- tclVar("DATA")
df <- tclVar(15)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(df)        <-""
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
df.entry       <- tkentry(tt, textvariable=df,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         df      <- as.numeric(tclObj(df))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dchisq(X=eval(e1),df=df)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.(degrees of freedom (non-negative, but can be non-integer).).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom : "), df.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dbetaGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="         Statistical Analysis \n Kolmogorov-Smirnov Tests\n      The Beta Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rbeta(100,1,1)
dat  <- tclVar("DATA")
shape1 <- tclVar(1)
shape2 <- tclVar(1)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(shape1)    <-""
         tclvalue(shape2)    <-""
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
shape1.entry   <- tkentry(tt, textvariable=shape1,width = 30)
shape2.entry   <- tkentry(tt, textvariable=shape2,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         shape1  <- as.numeric(tclObj(shape1))
         shape2  <- as.numeric(tclObj(shape2))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dbeta(X=eval(e1),shape1 =shape1, shape2=shape2)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape 1 : "), shape1.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape 2 : "), shape2.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dfGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="        Statistical Analysis \n Kolmogorov-Smirnov Tests\n        The F Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rf(100,2,1)
dat  <- tclVar("DATA")
df1 <- tclVar(2)
df2 <- tclVar(1)
reset <- function()
        {
         tclvalue(dat)      <-""
         tclvalue(df1)      <-""
         tclvalue(df2)      <-""
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
df1.entry      <- tkentry(tt, textvariable=df1,width = 30)
df2.entry      <- tkentry(tt, textvariable=df2,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         df1     <- as.numeric(tclObj(df1))
         df2     <- as.numeric(tclObj(df2))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_df(X=eval(e1),df1 =df1, df2=df2)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.(degrees of freedom (non-negative, but can be non-integer).).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom  1 : "), df1.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.(degrees of freedom (non-negative, but can be non-integer).)..",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom  2 : "), df2.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dtGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="         Statistical Analysis \n Kolmogorov-Smirnov Tests\n    The Student Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <- rt(1000,3)
dat  <- tclVar("DATA")
df   <- tclVar(3)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(df)        <-""
         }
tkentry        <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 30)
df.entry       <- tkentry(tt, textvariable=df,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         df      <- as.numeric(tclObj(df))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dt(X=eval(e1),df=df)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.(degrees of freedom (non-negative, but can be non-integer).).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="degrees of freedom : "), df.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dweibullGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="         Statistical Analysis \n Kolmogorov-Smirnov Tests\n   The Weibull Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <-  rweibull(1000,2,1)
dat   <- tclVar("DATA")
shape <- tclVar(2)
scale <- tclVar(1)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(shape)     <-""
         tclvalue(scale)     <-""
         tclvalue(leve)      <-"0.95"
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
shape.entry   <- tkentry(tt, textvariable=shape,width = 30)
scale.entry   <- tkentry(tt, textvariable=scale,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         shape   <- as.numeric(tclObj(shape))
         scale    <- as.numeric(tclObj(scale))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dweibull(X=eval(e1),shape =shape, scale=scale)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Shape : "), shape.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Scale : "), scale.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dnormGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="        Statistical Analysis \n Kolmogorov-Smirnov Tests\n   The Normal Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <-  rnorm(1000,2,0.5)
dat   <- tclVar("DATA")
mean <- tclVar(2)
sd <- tclVar(0.5)
reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(mean)      <-""
         tclvalue(sd)        <-""
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
mean.entry    <- tkentry(tt, textvariable=mean,width = 30)
sd.entry      <- tkentry(tt, textvariable=sd,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         mean    <- as.numeric(tclObj(mean))
         sd      <- as.numeric(tclObj(sd))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dnorm(X=eval(e1),mean =mean, sd=sd)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Mean : "), mean.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sd : "), sd.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.test_ks_dlognormGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="          Statistical Analysis \n Kolmogorov-Smirnov Tests \nThe Log Normal Distribution",command=function(){print(help("ks.test"))},width=50)
tkgrid(but,row=2,columnspan = 3,sticky="ew")

DATA <-  rlnorm(1000,2,0.5)
dat   <- tclVar("DATA")
meanlog <- tclVar(2)
sdlog <- tclVar(0.5)

reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(meanlog)   <-""
         tclvalue(sdlog)     <-""
         }
tkentry       <- ttkentry
dat.entry     <- tkentry(tt, textvariable=dat,width = 30)
meanlog.entry   <- tkentry(tt, textvariable=meanlog,width = 30)
sdlog.entry   <- tkentry(tt, textvariable=sdlog,width = 30)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         meanlog   <- as.numeric(tclObj(meanlog))
         sdlog    <- as.numeric(tclObj(sdlog))
         e1      <- try(parse(text=dat))
         eval(substitute(test_ks_dlognorm(X=eval(e1),meanlog =meanlog, sdlog=sdlog)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = DATA)",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Meanlog : "), meanlog.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Parameters of the distribution specified.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sdlog : "), sdlog.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Ok",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.hist_generalGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but2 <- tkbutton(tt,text="               Statistical Analysis \nHistogram for the Random Variable X?",command=function(){print(help("hist_general"))})
tkgrid(but2,row=1,columnspan = 3,sticky="ew")

dat                <- tclVar("eval(rgamma(1000,1,4))")
Law                <- tclVar("GAmma")
Breaks             <- tclVar(nclass.Sturges(eval(rgamma(1000,1,4))))



dat.entry          <- tkentry(tt, textvariable=dat,width = 20)
Breaks.entry       <- tkentry(tt, textvariable=Breaks)
Law.entry          <- tkentry(tt, textvariable=Law)

reset <- function()
        {
         tclvalue(dat)      <-""
        }

USTHB2 <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         Breaks  <- as.numeric(tclObj(Breaks))
         Law     <- as.character(tclObj(Law))
         e1      <- try(parse(text=dat))
        eval(substitute(hist_general(Data=eval(e1),Breaks,Law)))
        }
UA1 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(nclass.Sturges(eval(e1))))
       }     
UA2 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(nclass.scott(eval(e1))))
       }     
UA3 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(nclass.FD(eval(e1))))
       }     

    replot.maybe <- function(...)
    {
        dat     <- as.character(tclObj(dat))
        e1      <- try(parse(text=dat)) 
        if (as.numeric(tclObj(Breaks)) != nclass.Sturges(eval(e1))) USTHB2()
    }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = X Or eval(rexp(1000,2)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

frame2 <- tkframe(tt, relief = "ridge", borderwidth = 25)

tkgrid(tklabel(frame2,text = "Numbre of classe : "),sticky = "w")
SliderValueLabel <- tklabel(frame2)
tkgrid(tklabel(frame2,text=""),row=5, column=1)
tkconfigure(SliderValueLabel,textvariable=Breaks)
slider <- tkscale(frame2,command=replot.maybe,from=1, to=100,showvalue=FALSE, variable= Breaks,
                   resolution=1, orient="horizontal")
tkgrid(slider,row=5, columnspan=5,sticky="ew")

tkgrid(tkradiobutton(frame2, text = "nclass.Sturges",value = UA1(), variable = Breaks,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          Law     <- as.character(tclObj(Law))
                          hist_general(Data=eval(e1),Breaks=nclass.Sturges(eval(e1)),Law)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "nclass.Scott",value = UA2(),variable = Breaks,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          Law     <- as.character(tclObj(Law))
                          hist_general(Data=eval(e1),Breaks=nclass.scott(eval(e1)),Law)}), 
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "nclass.Freedman-Diaconis", value = UA3(),variable = Breaks,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          Law     <- as.character(tclObj(Law))
                          hist_general(Data=eval(e1),Breaks=nclass.FD(eval(e1)),Law)}),
        sticky = "ew")
tkgrid(frame2, rowspan = 1,row=6,columnspan=5,padx=5,pady=5)


frame1 <- tkframe(tt, relief = "ridge", borderwidth = 18)
tkgrid(tkbutton(frame1, text="Distributions ?",command=function(){print(help("Distributions"))}))
tkgrid(tkradiobutton(frame1, text = "The Exponential Distribution", value = "exp", variable = Law),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Gamma Distribution", value = "GAmma", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Chi-Squared Distribution", value = "chisq", variable = Law),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Beta Distribution", value = "Beta", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Fisher F Distribution", value =  "fisher", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Student t Distribution", value = "student", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Weibull Distribution", value = "weibull", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Log Normal Distribution", value = "Normlog", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Normal Distribution", value = "Norm", variable = Law), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=12,columnspan=5,padx=5,pady=5)

reset.but   <- tkbutton(tt, text="Reset", command=reset)
submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,reset.but,q.but2,sticky="w",columnspan=1)
})
}

.Kern_generalGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt,0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but2 <- tkbutton(tt,text="                        Statistical Analysis \n Estimated Density of the Random Variable X?\n                Using The Kernel Method",command=function(){print(help("Kern_general"))},width=35)
tkgrid(but2,columnspan = 3,row=1,sticky="ew")

DATA   <- rexp(1000,3)
dat    <- tclVar("DATA")
bw     <- tclVar(bw.ucv(DATA))
k      <- tclVar("gaussian")
Law    <- tclVar("exp")
bw.sav <- 1

dat.entry      <- tkentry(tt, textvariable=dat,width = 20)
bw.entry       <- tkentry(tt, textvariable=bw)
k.entry        <- tkentry(tt, textvariable=k)
Law.entry      <- tkentry(tt, textvariable=Law)

reset <- function()
        {
         tclvalue(dat)      <-""
         tclvalue(Law)      <-"exp"
        }
USTHB2 <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))  
         bw      <- as.numeric(tclObj(bw))
         k       <- as.character(tclObj(k))
         Law     <- as.character(tclObj(Law))
         e1      <- try(parse(text=dat))
        eval(substitute(Kern_general(Data=eval(e1),bw,k,Law)))
        }
    replot.maybe <- function(...)
    {
        dat     <- as.character(tclObj(dat))
        e1      <- try(parse(text=dat)) 
        if (as.numeric(tclObj(bw)) != bw.sav) USTHB2()
    }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data.(Example names = DATA or names = eval(rexp(1000,1)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names of data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=1,sticky="e")

frame1 <- tkframe(tt, relief="ridge", borderwidth=5)

tkgrid(tkbutton(frame1, text="Kernel ?",command=function(){print(help("density"))}))
for ( i in c("gaussian", "epanechnikov", "rectangular",
                 "triangular","biweight", "cosine","optcosine") ) {
tmp <- tkradiobutton(frame1,text=i, value=i, variable=k)
tkgrid(tmp, sticky="w")
    }

tkgrid(frame1, rowspan = 1,row=3,column=0,padx=5,pady=5)


frame2 <-tkframe(tt, relief="ridge", borderwidth=17)
tkgrid(tkbutton(frame2, text="Bandwidth ?",command=function(){print(help("bw.ucv"))}))
tkgrid(tkscale(frame2,command=replot.maybe ,from=0.01, to=10.00,
                   showvalue=FALSE, variable=bw,
                   resolution=0.02, orient="horiz"))

UA1 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.nrd0(eval(e1))))
       }     
UA2 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.nrd(eval(e1))))
       }     
UA3 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.ucv(eval(e1))))
       }  
UA4 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.bcv(eval(e1))))
       }  
UA5 <- function(){
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat)) 
         e1      <- try(parse(text=dat))
        eval(substitute(bw.SJ(eval(e1))))
       }  
tkgrid(tkradiobutton(frame2, text = "Rule-of-thumb",value = UA1(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Law     <- as.character(tclObj(Law))
                          Kern_general(Data=eval(e1),bw=bw.nrd0(eval(e1)),k,Law)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Scott",value = UA2(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Law     <- as.character(tclObj(Law))
                          Kern_general(Data=eval(e1),bw=bw.nrd(eval(e1)),k,Law)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Unbiased cross-validation",value = UA3(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Law     <- as.character(tclObj(Law))
                          Kern_general(Data=eval(e1),bw=bw.ucv(eval(e1)),k,Law)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Biased cross-validation",value = UA4(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Law     <- as.character(tclObj(Law))
                          Kern_general(Data=eval(e1),bw=bw.bcv(eval(e1)),k,Law)}),
        sticky = "ew")
tkgrid(tkradiobutton(frame2, text = "Sheather & Jones",value = UA5(), variable = bw,
       command=function(){dat     <- as.character(tclObj(dat)) 
                          e1      <- try(parse(text=dat))
                          k       <- as.character(tclObj(k))
                          Law     <- as.character(tclObj(Law))
                          Kern_general(Data=eval(e1),bw=bw.SJ(eval(e1)),k,Law)}),
        sticky = "ew")
tkgrid(frame2, rowspan = 1,row=3,column=1,padx=5,pady=5)

frame3 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tkbutton(frame3, text="Distributions ?",command=function(){print(help("Distributions"))}))
tkgrid(tkradiobutton(frame3, text = "The Exponential Distribution", value = "exp", variable = Law),
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Gamma Distribution", value = "GAmma", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Chi-Squared Distribution", value = "chisq", variable = Law),
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Beta Distribution", value = "Beta", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Fisher F Distribution", value =  "fisher", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Student t Distribution", value = "student", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Weibull Distribution", value = "weibull", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Log Normal Distribution", value = "Normlog", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame3, text = "The Normal Distribution", value = "Norm", variable = Law), 
        sticky = "w")
tkgrid(frame3, rowspan = 1,row=12,columnspan=5,padx=5,pady=5)
reset.but   <- tkbutton(tt, text="Reset", command=reset)
submit.but2 <- tkbutton(tt, text="Go!",
                      command=function(){USTHB2()})
q.but2 <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but2,q.but2,sticky="ew",columnspan=1)
})
}


.fctgeneralGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Statistical Analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="                              Statistical Analysis \nEmpirical Distribution for the Random Variable X",command=function(){print(help("fctgeneral"))},width=50)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

dat  <- tclVar("eval(rgamma(1000,1,4))")
Law <- tclVar("GAmma")


reset <- function()
        {
         tclvalue(dat)       <-""
         tclvalue(Law)       <-"GAmma"
         }
tkentry       <- ttkentry
dat.entry      <- tkentry(tt, textvariable=dat,width = 25)
Law.entry <- tkentry(tt, textvariable=Law)
USTHB <- function(...) 
        {
         if (is.null(dat)) return()
         dat     <- as.character(tclObj(dat))
         e1      <- try(parse(text=dat)) 
         Law     <- as.character(tclObj(Law))
        eval(substitute(fctgeneral(Data=eval(e1),Law)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Names for your data (Example names = X Or eval(rexp(1000,2)))",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Names data : "), dat.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

frame1 <- tkframe(tt, relief = "ridge", borderwidth = 10)
tkgrid(tkbutton(frame1, text="Distributions ?",command=function(){print(help("Distributions"))}))
tkgrid(tkradiobutton(frame1, text = "The Exponential Distribution", value = "exp", variable = Law),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Gamma Distribution", value = "GAmma", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Chi-Squared Distribution", value = "chisq", variable = Law),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Beta Distribution", value = "Beta", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Fisher F Distribution", value =  "fisher", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Student t Distribution", value = "student", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Weibull Distribution", value = "weibull", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Log Normal Distribution", value = "Normlog", variable = Law), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "The Normal Distribution", value = "Norm", variable = Law), 
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=12,columnspan=5,padx=5,pady=5)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Go!",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Attra2D <- function()
       {
N=1000;t0=0;Dt=0.001;T=1;X0=2;Y0=1;v=0.2;K=3;Sigma=0.1;

drifx     <- expression( (-K*x) / (x^2+y^2) )
drify     <- expression( (-K*y) / (x^2+y^2) )
diff      <- expression( Sigma ) 

Ax    <- function(t,x,y)  eval(drifx)
Ay    <- function(t,x,y)  eval(drify)
S     <- function(t,x,y)  eval(diff)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}

Dt= (T-t0)/N 
ux = runif(N,0,1)
ox = rep(1,N)
ox [ which(ux < 0.5) ] = -1
wx = cumsum(c(0,ox))*sqrt((T-t0)/N)
Dx   <- diff(wx)

uy = runif(N,0,1)
oy = rep(1,N)
oy [ which(uy < 0.5) ] = -1
wy = cumsum(c(0,oy))*sqrt((T-t0)/N)
Dy    <- diff(wy)

X    <- numeric()
Y    <- numeric()
X[1] <- X0
Y[1] <- Y0
for (i in 2:(N+1)){ 
        X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1])*Dt + S(t[i-1],X[i-1],Y[i-1])*Dx[i-1]
        Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1])*Dt + S(t[i-1],X[i-1],Y[i-1])*Dy[i-1]
                   } 
R = sqrt((X^2) + (Y^2))
n = which(R <= v)
if (length(n) > 0){
X    <- X[c(seq(1,min(n),by=1))]
Y    <- Y[c(seq(1,min(n),by=1))]
time <- t[c(seq(1,min(n),by=1))]}else{X <- X ; Y <- Y ; time <- t}

plot(X,Y,las=1,type="n",xlim=c(pmin(0,min(X)),max(X)),ylim=c(pmin(0,min(Y)),max(Y)),xlab=expression(X[t]),ylab=expression(Y[t]))
theta = seq(0,2*pi,length=1000)
a = v *cos(theta)
b = v *sin(theta)
points(a,b,type="l",col="gray")
polygon(a, b, col="gray")

if (X0 >= 0 || Y0 >= 0){
arrows(0,0,v*cos(pi/4),v*sin(pi/4), col= "black",code = 2,length = 0.1, angle = 20,lwd=2)
segments(0,0,v*cos(pi/4) ,v*sin(pi/4),col= "black",lwd=2)
points(0,0,type="p",pch=20,col="black",cex=1.6)
text((1/2)*v*cos(pi/4),(1/1.5)*v*sin(pi/4), "v", col="black", adj=c(-.1,-.1))}

if (X0 < 0 || Y0 < 0){
arrows(0,0,v*cos((7*pi)/4),v*sin((7*pi)/4), col= "black",code = 2,length = 0.1, angle = 20,lwd=2)
segments(0,0,v*cos((7*pi)/4) ,v*sin((7*pi)/4),col= "black",lwd=2)
points(0,0,type="p",pch=20,col="black",cex=1.6)
text((1/2)*v*cos((7*pi)/4),(1/1.5)*v*sin((7*pi)/4), "v", col="black", adj=c(-.1,-.1))}

mtext(expression("Simulation 2-Dimensional Attractive Model":bolditalic(M[(list(s==1,sigma))])),line=3.1,adj=0.8,cex=0.85,col="black")
mtext(bquote(dX[t]== frac(-K*X[t],X[t]^{2}+Y[t]^{2})*dt + sigma *d*W[t]^1),cex=0.7,adj=0,line=2.1,col="blue")
mtext(bquote(dY[t]== frac(-K*Y[t],X[t]^{2}+Y[t]^{2})*dt + sigma *d*W[t]^2),cex=0.7,adj=0,line=0.2,col="blue")

abline(h=0, v=0, col = "gray60",lwd=2)
mtext(bquote(X[t[0]]==.(X0)),line=1.4,adj=0.85,cex=0.9,col="green4")
mtext(bquote(Y[t[0]]==.(Y0)),line=0.4,adj=0.85,cex=0.9,col="green4")
mtext(bquote(K== .(K)),line=1.6,adj=1,cex=0.9,col="blue")
mtext(bquote(sigma== .(Sigma)),line=0.6,adj=1,cex=0.9,col="blue")
mtext(bquote(v== .(v)),line=0.7,adj=0.7,cex=0.9,col="black")

points(X0,Y0,type="p",pch=20,col="green4",cex=1.8)
text(X0,Y0, expression((list(X[t[0]],Y[t[0]]))), col="green4", adj=c(.5,-.2),cex = 0.8)

if (length(n) > 0 ){
for (i in 1:min(n)){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="blue",lwd=2)}}else{
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="blue",lwd=2)}}

if (length(n) > 0 ){points(X[min(n)],Y[min(n)],type="p",col="red",cex=1.2,pch="*")
                    text(X[min(n)],Y[min(n)], expression(tau[v]^(1)), col=2, adj=c(-.1,-.1),cex = 1.2)
                    mtext(bquote(tau[v]^(1)== .(t[min(n)])),line=0.5,adj=0.45,cex=1,col="red")}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Fri Dec 10 21:04:14 2010"),side = 1, line = 4, adj = 0.5, cex = .66)
}

.Attra3D <- function()
       {
N=1000;t0=0;Dt=0.001;T=1;X0=2;Y0=1;Z0=1;v=0.4;K=3.5;Sigma=0.2;

drifx     <- expression( (-K*x) / (x^2 + y^2 + z^2) )
drify     <- expression( (-K*y) / (x^2 + y^2 + z^2) )
drifz     <- expression( (-K*z) / (x^2 + y^2 + z^2) )
diff      <- expression( Sigma ) 

Ax    <- function(t,x,y,z)  eval(drifx)
Ay    <- function(t,x,y,z)  eval(drify)
Az    <- function(t,x,y,z)  eval(drifz)
S     <- function(t,x,y,z)  eval(diff)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt= (T-t0)/N 

ux = runif(N,0,1)
ox = rep(1,N)
ox [ which(ux < 0.5) ] = -1
wx = cumsum(c(0,ox))*sqrt((T-t0)/N)
Dx    <- diff(wx)

uy = runif(N,0,1)
oy = rep(1,N)
oy [ which(uy < 0.5) ] = -1
wy = cumsum(c(0,oy))*sqrt((T-t0)/N)
Dy    <- diff(wy)

uz = runif(N,0,1)
oz = rep(1,N)
oz [ which(uz < 0.5) ] = -1
wz = cumsum(c(0,oz))*sqrt((T-t0)/N)
Dz    <- diff(wz)

X    <- numeric()
Y    <- numeric()
Z    <- numeric()
X[1] <- X0
Y[1] <- Y0
Z[1] <- Z0
for (i in 2:(N+1)){     
        X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + S(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]
        Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + S(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1]
        Z[i] = Z[i-1] + Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + S(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1]
                   } 
R = sqrt((X^2) + (Y^2) + (Z^2))
n = which(R <= v)

if (length(n) > 0){
X    <- X[c(seq(1,min(n),by=1))]
Y    <- Y[c(seq(1,min(n),by=1))]
Z    <- Z[c(seq(1,min(n),by=1))]
time <- t[c(seq(1,min(n),by=1))]}else{X <- X ; Y <- Y ; Z <- Z ; time <- t}

G <- data.frame(X,Y,Z)
V = 1
if ( V  > v ) { V =1 }
if ( V <= v ) { V = v + 1 }

a <- c(0,V,0,0)
b <- c(0,0,V,0)
c <- c(0,0,0,V)
labels <- c("Origin", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)

open3d()
spheres3d(0,0,0,v,color=("white"), shininess = 128,alpha=0.2,front= "line")  
segments3d(c(0,v*cos(-pi/4)*cos(3*pi/4)),c(0,v*sin(-3*pi/4)*cos(pi/4)),c(0,v*sin(pi/4)),color = c("black"),lwd= 2.0)
text3d(0.5*v*cos(-pi/4)*cos(3*pi/4),0.5*v*sin(-3*pi/4)*cos(pi/4),0.5*v*sin(pi/4),c("v"),adj=c(0.5,-0.25),cex=1.2,family=c("serif"))

segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(X0,Y0,Z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=1.2,family=c("serif"))
points3d(G[1,],color = c("blue"),size=6)
title3d(family=c("serif"),main="Simulation Three-Dimensional Attractive Model M(S=1,Sigma)",color = c("black"),cex=1.2)

if (length(n) > 0){
for (i in 1:min(n)) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="red",from ="lines",lwd=2)}}else
{for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="red",from ="lines",lwd=2)}}
if (length(n) > 0 ){points3d(X[min(n)],Y[min(n)],Z[min(n)],col="blue",size=8)
                    text3d(X[min(n)],Y[min(n)],Z[min(n)],texts=c("FPT = "),adj=c(0.5,-0.8),color = c("blue"),cex=1.2,family=c("serif"))
                    text3d(X[min(n)],Y[min(n)],Z[min(n)],texts=c(t[min(n)]),adj=c(-0.9,-0.8),color = c("blue"),cex=1.2,family=c("serif"))
                    text3d(V,V,V,c("FPT : First Passage Time"),adj=c(0.5,-0.25),cex=1.2,col="blue",family=c("serif"))
                    }
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sun Jan 16 16:10:01 2011',color = c("blue"),cex=0.8)
}

.Attra2D2 <- function()
          {

N=3000;t0=0;Dt=0.001;T=1;X1_0=2;X2_0=2;Y1_0=-0.5;Y2_0=-1;v=0.05;K=3;m=0.4;Sigma=0.15;

Sigmax <- Sigma
Sigmay <- Sigma
drifx1     <- expression( (-K*(x1-y1)) / (sqrt((x1-y1)^2+(x2-y2)^2))^(m+1) )
drifx2     <- expression( (-K*(x2-y2)) / (sqrt((x1-y1)^2+(x2-y2)^2))^(m+1) )
diffx      <- expression( Sigmax ) 
diffy      <- expression( Sigmay )

Ax1    <- function(t,x1,x2,y1,y2)  eval(drifx1)
Ax2    <- function(t,x1,x2,y1,y2)  eval(drifx2)
Sx     <- function(t,x1,x2,y1,y2)  eval(diffx)
Sy     <- function(t,x1,x2,y1,y2)  eval(diffy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}

Dt= (T-t0)/N 
ux1 = runif(N,0,1)
ox1 = rep(1,N)
ox1 [ which(ux1 < 0.5) ] = -1
wx1 = cumsum(c(0,ox1))*sqrt((T-t0)/N)
Dx1     <- diff(wx1)

ux2 = runif(N,0,1)
ox2 = rep(1,N)
ox2 [ which(ux2 < 0.5) ] = -1
wx2 = cumsum(c(0,ox2))*sqrt((T-t0)/N)
Dx2     <- diff(wx2)

uy1 = runif(N,0,1)
oy1 = rep(1,N)
oy1 [ which(uy1 < 0.5) ] = -1
wy1 = cumsum(c(0,oy1))*sqrt((T-t0)/N)
Dy1     <- diff(wy1)

uy2 = runif(N,0,1)
oy2 = rep(1,N)
oy2 [ which(uy2 < 0.5) ] = -1
wy2 = cumsum(c(0,oy2))*sqrt((T-t0)/N)
Dy2     <- diff(wy2)

X1    <- numeric()
X2    <- numeric()
Y1    <- numeric()
Y2    <- numeric()
D     <- numeric()
X1[1] <- X1_0
X2[1] <- X2_0
Y1[1] <- Y1_0
Y2[1] <- Y2_0

for (i in 2:(N+1)){ 
        Y1[i] = Y1[i-1] + Sy(t[i-1],X1[i-1],X2[i-1],Y1[i-1],Y2[i-1]) * Dy1[i-1]
        Y2[i] = Y2[i-1] + Sy(t[i-1],X1[i-1],X2[i-1],Y1[i-1],Y2[i-1]) * Dy2[i-1]       
        X1[i] = X1[i-1] + Ax1(t[i-1],X1[i-1],X2[i-1],Y1[i-1],Y2[i-1])*Dt + 
                2 * Sx(t[i-1],X1[i-1],X2[i-1],Y1[i-1],Y2[i-1]) * Dx1[i-1]
        X2[i] = X2[i-1] + Ax2(t[i-1],X1[i-1],X2[i-1],Y1[i-1],Y2[i-1])*Dt + 
                2 * Sx(t[i-1],X1[i-1],X2[i-1],Y1[i-1],Y2[i-1]) * Dx2[i-1]
}
for (i in 1:(N+1)){D[i]  = sqrt((X1[i]-Y1[i])^2 + (X2[i]-Y2[i])^2)}

NN <- which(D <= v)
if(length(NN)>0) {nn <- min(NN)}
if(length(NN)> 0){D <- D[seq(1,nn,by=1)]}
if(length(NN)> 0){X1 <- X1[seq(1,nn,by=1)]}
if(length(NN)> 0){X2 <- X2[seq(1,nn,by=1)]}
if(length(NN)> 0){Y1 <- Y1[seq(1,nn,by=1)]}
if(length(NN)> 0){Y2 <- Y2[seq(1,nn,by=1)]}
if(length(NN)> 0){t <- t[seq(1,nn,by=1)]}
plot(X1,X2,type="n",las=1,xlim=c(min(min(X1,Y1)),max(max(X1,Y1))),ylim=c(min(min(X2,Y2)),max(max(X2,Y2))),
     xlab=expression((list(X[t]^(1),Y[t]^(1)))),ylab=expression((list(X[t]^(2),Y[t]^(2)))),cex.lab=0.8)

mtext(expression("2-Dimensional Attractive Model for 2-Diffusion Processes"),line=3.55,adj=0.5,cex=0.8,col="black")
mtext(expression( bolditalic(M[mu(.)]^sigma * (V[t]^(1)) %<-% M[0]^sigma*(V[t]^(2)))),line=2.1,adj=0.5,cex=0.8,col="green4")

mtext(bquote( bolditalic(V[t]^(1)==(list(X[t]^(1),X[t]^(2))) ) ),cex=0.7,adj=0,line=2.4,col="red")
mtext(bquote( bolditalic(V[t]^(2)==(list(Y[t]^(1),Y[t]^(2))) ) ),cex=0.7,adj=0,line=1.4,col="blue")
mtext(bquote( bolditalic(D[t]==V[t]^(1) - V[t]^(2)) ),cex=0.7,adj=0,line=0.4,col="green4")
mtext(bquote(X[t[0]]^(1)==.(X1_0)),line=2,adj=0.85,cex=0.7,col="red")
mtext(bquote(X[t[0]]^(2)==.(X2_0)),line=1,adj=0.85,cex=0.7,col="red")
mtext(bquote(Y[t[0]]^(1)==.(Y1_0)),line=2,adj=1,cex=0.7,col="blue")
mtext(bquote(Y[t[0]]^(2)==.(Y2_0)),line=1,adj=1,cex=0.7,col="blue")
mtext(bquote((list(K,m,sigma,v))==(list(.(K),.(m),.(Sigmax),.(v)))),line=0.2,adj=1,cex=0.7,col="green4")

for (i in 1:length(D)){
lines(c(Y1[i],Y1[i+1]),c(Y2[i],Y2[i+1]),type="l",col="blue",lwd=2)
lines(c(X1[i],X1[i+1]),c(X2[i],X2[i+1]),type="l",col="red",lwd=2)
                 }
n <- which(D <= v)
if (length(n) > 0) {thoV1V2 <- t[min(n)]
mtext(bquote( bolditalic( tau[group("||",D[t],"||")<=v]^(m)*(list(V[t]^(1),V[t]^(2)))==.(round(thoV1V2,4)) )  ),cex=0.9,adj=0.5,line=0.8,col="black")
points(X1[length(D)],X2[length(D)],pch=19,col="black",cex=1.1)
legend("topleft",bg="gray85",border="gray",expression(group("||",D[t],"||")<=v),col=c("black"),pch=19,cex=0.7)
}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Jan 18 22:04:57 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}


.Attra3D2 <- function()
          {
N=1000;t0=0;Dt=0.001;T=1;X1_0=1;X2_0=0;X3_0=-1;Y1_0=1;
Y2_0=0;Y3_0=1;v=0.05;K=3;m=0.1;Sigma=0.2;

Sigmax <- Sigma
Sigmay <- Sigma
drifx1     <- expression( (-K*(x1-y1)) / (sqrt((x1-y1)^2+(x2-y2)^2 +(x3-y3)^2))^(m+1) )
drifx2     <- expression( (-K*(x2-y2)) / (sqrt((x1-y1)^2+(x2-y2)^2 +(x3-y3)^2))^(m+1) )
drifx3     <- expression( (-K*(x3-y3)) / (sqrt((x1-y1)^2+(x2-y2)^2 +(x3-y3)^2))^(m+1) )
diffx      <- expression( Sigmax ) 
diffy      <- expression( Sigmay )


Ax1    <- function(t,x1,x2,x3,y1,y2,y3)  eval(drifx1)
Ax2    <- function(t,x1,x2,x3,y1,y2,y3)  eval(drifx2)
Ax3    <- function(t,x1,x2,x3,y1,y2,y3)  eval(drifx3)
Sx     <- function(t,x1,x2,x3,y1,y2,y3)  eval(diffx)
Sy     <- function(t,x1,x2,x3,y1,y2,y3)  eval(diffy)


if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt= (T-t0)/N 

ux1 = runif(N,0,1)
ox1 = rep(1,N)
ox1 [ which(ux1 < 0.5) ] = -1
wx1 = cumsum(c(0,ox1))*sqrt((T-t0)/N)
Dx1     <- diff(wx1)

ux2 = runif(N,0,1)
ox2 = rep(1,N)
ox2 [ which(ux2 < 0.5) ] = -1
wx2 = cumsum(c(0,ox2))*sqrt((T-t0)/N)
Dx2     <- diff(wx2)

ux3 = runif(N,0,1)
ox3 = rep(1,N)
ox3 [ which(ux3 < 0.5) ] = -1
wx3 = cumsum(c(0,ox3))*sqrt((T-t0)/N)
Dx3     <- diff(wx3)

uy1 = runif(N,0,1)
oy1 = rep(1,N)
oy1 [ which(uy1 < 0.5) ] = -1
wy1 = cumsum(c(0,oy1))*sqrt((T-t0)/N)
Dy1     <- diff(wy1)

uy2 = runif(N,0,1)
oy2 = rep(1,N)
oy2 [ which(uy2 < 0.5) ] = -1
wy2 = cumsum(c(0,oy2))*sqrt((T-t0)/N)
Dy2     <- diff(wy2)

uy3 = runif(N,0,1)
oy3 = rep(1,N)
oy3 [ which(uy3 < 0.5) ] = -1
wy3 = cumsum(c(0,oy3))*sqrt((T-t0)/N)
Dy3     <- diff(wy3)

X1    <- numeric()
X2    <- numeric()
X3    <- numeric()
Y1    <- numeric()
Y2    <- numeric()
Y3    <- numeric()
D     <- numeric()
X1[1] <- X1_0
X2[1] <- X2_0
X3[1] <- X3_0
Y1[1] <- Y1_0
Y2[1] <- Y2_0
Y3[1] <- Y3_0
for (i in 2:(N+1)){ 
        Y1[i] = Y1[i-1] + Sy(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1]) * Dy1[i-1]
        Y2[i] = Y2[i-1] + Sy(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1]) * Dy2[i-1] 
        Y3[i] = Y3[i-1] + Sy(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1]) * Dy3[i-1]   
   
        X1[i] = X1[i-1] + Ax1(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1])*Dt + 
                2* Sx(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1]) * Dx1[i-1]
        X2[i] = X2[i-1] + Ax2(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1])*Dt + 
                2* Sx(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1]) * Dx2[i-1]
        X3[i] = X3[i-1] + Ax3(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1])*Dt + 
                2* Sx(t[i-1],X1[i-1],X2[i-1],X3[i-1],Y1[i-1],Y2[i-1],Y3[i-1]) * Dx3[i-1]
}
D  = sqrt((X1-Y1)^2 + (X2-Y2)^2 +(X3-Y3)^2)
n = which(D <= v)

if (length(n) > 0){
X1    <- X1[c(seq(1,min(n),by=1))]
X2    <- X2[c(seq(1,min(n),by=1))]
X3    <- X3[c(seq(1,min(n),by=1))]
Y1    <- Y1[c(seq(1,min(n),by=1))]
Y2    <- Y2[c(seq(1,min(n),by=1))]
Y3    <- Y3[c(seq(1,min(n),by=1))]
D     <- D[c(seq(1,min(n),by=1))]
t     <- t[c(seq(1,min(n),by=1))]}else{X1 <- X1 ; X2 <- X2 ; X3 <- X3;Y1 <- Y1;Y2 <- Y2;Y3<-Y3;D<-D ; t <- t}

Gx <- data.frame(X1,X2,X3)
Gy <- data.frame(Y1,Y2,Y3)
V = 1
if ( V  > v ) { V =1 }
if ( V <= v ) { V = v + 1 }

a <- c(0,V,0,0)
b <- c(0,0,V,0)
c <- c(0,0,0,V)
labels <- c("Origin", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)

open3d()
##spheres3d(0,0,0,v,color=("white"), shininess = 128,alpha=0.2,front= "line")  
##segments3d(c(0,v*cos(-pi/4)*cos(3*pi/4)),c(0,v*sin(-3*pi/4)*cos(pi/4)),c(0,v*sin(pi/4)),color = c("black"),lwd= 2.0)
##text3d(0.5*v*cos(-pi/4)*cos(3*pi/4),0.5*v*sin(-3*pi/4)*cos(pi/4),0.5*v*sin(pi/4),c("v"),adj=c(0.5,-0.25),cex=1.2,family=c("serif"))

segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0)
text3d(a,b,c,labels,adj=0.5,col="green4",cex=1.2,family=c("serif"))
text3d(X1_0,X2_0,X3_0,c("(X1,X2,X3)"),adj=c(0.5,-0.25),cex=1.2,family=c("serif"))
points3d(Gx[1,],color = c("red"),size=6)
text3d(Y1_0,Y2_0,Y3_0,c("(Y1,Y2,Y3)"),adj=c(0.5,-0.25),cex=1.2,family=c("serif"))
points3d(Gy[1,],color = c("blue"),size=6)
title3d(family=c("serif"),main="3-Dimensional Attractive Model for 2-Diffusion Processes",color = c("black"),cex=1.2)

if (length(n) > 0){
for (i in 1:min(n)) {lines3d(c(Gy[i,1],Gy[i+1,1]),c(Gy[i,2],Gy[i+1,2]),c(Gy[i,3],Gy[i+1,3]),col="blue",from ="lines",lwd=2)
                     lines3d(c(Gx[i,1],Gx[i+1,1]),c(Gx[i,2],Gx[i+1,2]),c(Gx[i,3],Gx[i+1,3]),col="red",from ="lines",lwd=2)}}else
{for (i in 1:N) {lines3d(c(Gy[i,1],Gy[i+1,1]),c(Gy[i,2],Gy[i+1,2]),c(Gy[i,3],Gy[i+1,3]),col="blue",from ="lines",lwd=2)
                 lines3d(c(Gx[i,1],Gx[i+1,1]),c(Gx[i,2],Gx[i+1,2]),c(Gx[i,3],Gx[i+1,3]),col="red",from ="lines",lwd=2)}}

if (length(n) > 0 ){points3d(X1[min(n)],X2[min(n)],X3[min(n)],col="green",size=8)
                    text3d(X1[min(n)],X2[min(n)],X3[min(n)],texts=c("FPT = "),adj=c(0.5,-0.8),color = c("green"),cex=1.2,family=c("serif"))
                    text3d(X1[min(n)],X2[min(n)],X3[min(n)],texts=c(t[min(n)]),adj=c(-0.9,-0.8),color = c("green"),cex=1.2,family=c("serif"))
                    text3d(V,V,V,c("FPT : First Passage Time"),adj=c(0.5,-0.25),cex=1.2,col="green",family=c("serif"))
                    }
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Sat Feb 05 16:34:11 2011',color = c("blue"),cex=0.8)
}

.BMN2DGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Brownian Motion")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Brownian Motion Two-Dimensional \n                    by normal law?",command=function(){print(help("BMN2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(10000)
T  <- tclVar(1)
t0 <- tclVar(0)
Sigma <- tclVar(0.2)
x0 <- tclVar(0)
y0  <- tclVar(0)
Step <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(y0)     <-""
         tclvalue(Sigma)  <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Step)   <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 25)
t0.entry      <- tkentry(tt, textvariable=t0,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
x0.entry      <- tkentry(tt, textvariable=x0,width = 25)
y0.entry      <- tkentry(tt, textvariable=y0,width = 25)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 25)
Output.entry  <- tkentry(tt, textvariable=Output)
Step.entry <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         y0     <- as.numeric(tclObj(y0))   
         Sigma  <- as.numeric(tclObj(Sigma))     
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(BMN2D(N, t0, T, x0, y0,Sigma, Step, Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="y0 = 2.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Sigma > 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=8,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.BMRW2DGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Brownian Motion")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Brownian Motion Two-Dimensional \n                 by Random Walk?",command=function(){print(help("BMRW2D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(10000)
T  <- tclVar(1)
t0 <- tclVar(0)
Sigma <- tclVar(0.2)
x0 <- tclVar(0)
y0  <- tclVar(0)
Step <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(x0)     <-""
         tclvalue(y0)     <-""
         tclvalue(Sigma)  <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Step)   <-"FALSE"
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 25)
t0.entry      <- tkentry(tt, textvariable=t0,width = 25)
T.entry       <- tkentry(tt, textvariable=T,width = 25)
x0.entry      <- tkentry(tt, textvariable=x0,width = 25)
y0.entry      <- tkentry(tt, textvariable=y0,width = 25)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 25)
Output.entry  <- tkentry(tt, textvariable=Output)
Step.entry <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         y0     <- as.numeric(tclObj(y0))   
         Sigma  <- as.numeric(tclObj(Sigma))     
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(BMRW2D(N, t0, T, x0, y0,Sigma, Step, Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="y0 = 2.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Sigma > 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=8,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=8,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}


.BMN3DGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Brownian Motion")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Brownian Motion Three-Dimensional \n                by normal law?",command=function(){print(help("BMN3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(1000)
T  <- tclVar(1)
t0 <- tclVar(0)
X0 <- tclVar(0.5)
Y0  <- tclVar(0.5)
Z0  <- tclVar(0.5)
Sigma <- tclVar(0.2)
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(X0)     <-""
         tclvalue(Y0)     <-""
         tclvalue(Z0)     <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Sigma)  <-""
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 20)
t0.entry      <- tkentry(tt, textvariable=t0,width = 20)
T.entry       <- tkentry(tt, textvariable=T,width = 20)
X0.entry      <- tkentry(tt, textvariable=X0,width = 20)
Y0.entry      <- tkentry(tt, textvariable=Y0,width = 20)
Z0.entry      <- tkentry(tt, textvariable=Z0,width = 20)
Output.entry  <- tkentry(tt, textvariable=Output)
Sigma.entry   <- tkentry(tt, textvariable=Sigma)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         X0     <- as.numeric(tclObj(X0))
         Y0     <- as.numeric(tclObj(Y0))   
         Z0     <- as.numeric(tclObj(Z0))     
         Output <- as.character(tclObj(Output))
         Sigma   <- as.numeric(tclObj(Sigma))
        eval(substitute(BMN3D(N, t0, T, X0, Y0, Z0, Sigma, Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="y0 = 2.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), Y0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="z0 = 2.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), Z0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Sigma > 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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


.BMRW3DGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Brownian Motion")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Brownian Motion Three-Dimensional \n               by Random Walk?",command=function(){print(help("BMRW3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(1000)
T  <- tclVar(1)
t0 <- tclVar(0)
X0 <- tclVar(0.5)
Y0  <- tclVar(0.5)
Z0  <- tclVar(0.5)
Sigma <- tclVar(0.2)
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)      <-""
         tclvalue(t0)     <-""
         tclvalue(T)      <-""
         tclvalue(X0)     <-""
         tclvalue(Y0)     <-""
         tclvalue(Z0)     <-""
         tclvalue(Output) <-"FALSE"
         tclvalue(Sigma)  <-""
         }
tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 20)
t0.entry      <- tkentry(tt, textvariable=t0,width = 20)
T.entry       <- tkentry(tt, textvariable=T,width = 20)
X0.entry      <- tkentry(tt, textvariable=X0,width = 20)
Y0.entry      <- tkentry(tt, textvariable=Y0,width = 20)
Z0.entry      <- tkentry(tt, textvariable=Z0,width = 20)
Output.entry  <- tkentry(tt, textvariable=Output)
Sigma.entry   <- tkentry(tt, textvariable=Sigma)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N      <- as.numeric(tclObj(N))  
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         X0     <- as.numeric(tclObj(X0))
         Y0     <- as.numeric(tclObj(Y0))   
         Z0     <- as.numeric(tclObj(Z0))     
         Output <- as.character(tclObj(Output))
         Sigma   <- as.numeric(tclObj(Sigma))
        eval(substitute(BMRW3D(N, t0, T, X0, Y0, Z0, Sigma, Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="x0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), X0.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="y0 = 2.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), Y0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="z0 = 2.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), Z0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")


DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Sigma > 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
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



.sde.sim2D <- function()
            {
N=5000;T=1;t0=0;x0=0;y0=0;Dt=0.001;
driftx <- expression(cos(t*x*y))
drifty <- expression(cos(t))
diffx  <- expression(0.1)
diffy  <- expression(0.1)

Ax    <- function(t,x,y)  eval(driftx)
Ay    <- function(t,x,y)  eval(drifty)
Sx    <- function(t,x,y)  eval(diffx)
Sy    <- function(t,x,y)  eval(diffy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
ux = runif(N,0,1)
ox = rep(1,N)
ox [ which(ux < 0.5) ] = -1
wx = cumsum(c(0,ox))*sqrt((T-t0)/N)
Dx    <- diff(wx)
uy = runif(N,0,1)
oy = rep(1,N)
oy [ which(uy < 0.5) ] = -1
wy = cumsum(c(0,oy))*sqrt((T-t0)/N)
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
    X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1]
    Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1] 
                  } 
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Euler scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",bg="gray85",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Mon Jan 31 11:03:46 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

.tho_02diffGUI <- function()
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
tkwm.title(tt, "Sim.DiffProc~~Attractive Model for 2-Diffusion Processes")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text="Simulation The First Passage Time FPT ? \n V(1)=(X(1),X(2)) and V(2)=(Y(1),Y(2))",command=function(){print(help("tho_02diff"))})
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N        <- tclVar(500)
M        <- tclVar(50)
T        <- tclVar(1)
t0       <- tclVar(0)
Dt       <- tclVar(0.001)
X1_0     <- tclVar(1)
X2_0     <- tclVar(1)
Y1_0     <- tclVar(0.5)
Y2_0     <- tclVar(0.5)
v        <- tclVar(0.05)
K        <- tclVar(4)
m        <- tclVar(0.4)
Sigma    <- tclVar(0.4)
Output   <- tclVar("FALSE")

reset <- function()
        {
         tclvalue(N)            <-""
         tclvalue(M)            <-""
         tclvalue(v)            <-""
         tclvalue(K)            <-""
         tclvalue(m)            <-""
         tclvalue(T)            <-""
         tclvalue(Dt)           <-""
         tclvalue(t0)           <-"0"
         tclvalue(Y1_0)         <-""
         tclvalue(Y2_0)         <-""
         tclvalue(X1_0)         <-""
         tclvalue(X2_0)         <-""
         tclvalue(Sigma)        <-""
         tclvalue(Output)       <-"FALSE"
         }

tkentry       <- ttkentry
N.entry       <- tkentry(tt, textvariable=N,width = 26)
M.entry       <- tkentry(tt, textvariable=M,width = 26)
K.entry       <- tkentry(tt, textvariable=K,width = 26)
m.entry       <- tkentry(tt, textvariable=m,width = 26)
Dt.entry      <- tkentry(tt, textvariable=Dt,width = 26)
v.entry       <- tkentry(tt, textvariable=v,width = 26)
t0.entry      <- tkentry(tt, textvariable=t0,width = 26)
T.entry       <- tkentry(tt, textvariable=T,width = 26)
X1_0.entry    <- tkentry(tt, textvariable=X1_0,width = 26)
X2_0.entry    <- tkentry(tt, textvariable=X2_0,width = 26)
Sigma.entry   <- tkentry(tt, textvariable=Sigma,width = 26)
Y1_0.entry    <- tkentry(tt, textvariable=Y1_0,width = 26)
Y2_0.entry    <- tkentry(tt, textvariable=Y2_0,width = 26)
Output.entry  <- tkentry(tt, textvariable=Output)

USTHB <- function(...) 
        {
         if (is.null(N)) return()
         N         <- as.numeric(tclObj(N))  
         M         <- as.numeric(tclObj(M)) 
         K         <- as.numeric(tclObj(K))
         m         <- as.numeric(tclObj(m))
         t0        <- as.numeric(tclObj(t0))
         T         <- as.numeric(tclObj(T))
         Dt        <- as.numeric(tclObj(Dt))
         X1_0      <- as.numeric(tclObj(X1_0))
         X2_0      <- as.numeric(tclObj(X2_0))
         Sigma     <- as.numeric(tclObj(Sigma))  
         Y1_0      <- as.numeric(tclObj(Y1_0))
         Y2_0      <- as.numeric(tclObj(Y2_0)) 
         v         <- as.numeric(tclObj(v))
         Output    <- as.character(tclObj(Output))
        eval(substitute(tho_02diff(N, M, t0, Dt, T = 1, X1_0, X2_0, Y1_0, Y2_0,v, K, m, Sigma,Output)))
        }

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 500.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example M = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of FPT (M) : "), M.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.001.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X1_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X1_0) : "), X1_0.entry, sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example X2_0 = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (X2_0) : "), X2_0.entry, sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y1_0 = 0.5.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y1_0) : "), Y1_0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example Y2_0 = -1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (Y2_0) : "), Y2_0.entry, sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message=" D=sqrt(V(1)^2 - V(2)^2) <= threshold \n Example threshold = 0.05 and D it is Distance between V(1) and V(2) .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="threshold : "), v.entry, sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="K : "), K.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (m > 0).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="m : "), m.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Constant positive (2*K > Sigma^2).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Sigma : "), Sigma.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=15,column=1)

reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

###################
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
w = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="red")
legend("topleft",border="gray",c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Euler.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
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
w = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="red")
legend("topleft",border="gray",c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Milstein.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
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
w = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="red")
legend("topleft",border="gray",c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "MilsteinS.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
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
w = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="red")
legend("topleft",border="gray",c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "STS.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
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
w = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="red")
legend("topleft",border="gray",c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Heun.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
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
w = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
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
for (i in 1:M){points(t,Q[,i],type="l",col="black",lwd=1)}
mtext(expression(a(t,X[t])==.),adj=0,col="red",line=1.8)
mtext(expression(sigma(t,X[t])==.),adj=0,col="red",line=0.4)
mtext(a,adj=0.17,col="red",line=1.8)
mtext(sigma,adj=0.17,col="red",line=0.4)
mtext(bquote(Delta*t==.(Dt)),line=0.2,cex=1,adj=1,col="blue")
mtext(bquote(T==.(T)),line=1.1,cex=1,adj=1,col="blue")
mtext(bquote(x[.(0)]==.(x0)),line=0.1,cex=1,adj=0.75,col="blue")
mtext(bquote(t[0]==.(t0)),line=0.9,cex=1,adj=0.75,col="blue")
if (M >=2){lines(t,Q.mean,lwd=2,col="red")
legend("topleft",border="gray",c("Average trajectory"),lty=c(1),col=c("red"),lwd=2)}
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria",date()),side = 1, line = 4, adj = 0.5, cex = .66)
time <- t
X.mean <- Q.mean
X <- Q
Result <- data.frame(time,X)
if (M >=2) {Result <- data.frame(time,Q,X.mean)}
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "RK3.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
    }

.Euler2D <-
function(N,T=1,t0,x0,y0,Dt,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))

Ax    <- function(t,x,y)  eval(driftx)
Ay    <- function(t,x,y)  eval(drifty)
Sx    <- function(t,x,y)  eval(diffx)
Sy    <- function(t,x,y)  eval(diffy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
    X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1]
    Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1] 
                  } 

if(Step==FALSE){
plot(X,Y,type="l",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
mtext(expression("Euler scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Euler scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2 ,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Euler2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}

.Milstein2D <-
function(N,T=1,t0,x0,y0,Dt,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))


DSxx   <- D(diffx,"x")
DSyy   <- D(diffy,"y")
Ax    <- function(t,x,y)  eval(driftx)
Ay    <- function(t,x,y)  eval(drifty)
Sx    <- function(t,x,y)  eval(diffx)
DSx   <- function(t,x,y)  eval(DSxx)
Sy    <- function(t,x,y)  eval(diffy)
DSy   <- function(t,x,y)  eval(DSyy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
    X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1]+
           0.5 *Sx(t[i-1],X[i-1],Y[i-1])*DSx(t[i-1],X[i-1],Y[i-1])*((Dx[i-1])^2 -Dt)
    Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1]+
           0.5 *Sy(t[i-1],X[i-1],Y[i-1])*DSy(t[i-1],X[i-1],Y[i-1])*((Dy[i-1])^2 -Dt) 
                  } 
				  
if(Step==FALSE){
plot(X,Y,type="l",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
mtext(expression("Milstein scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Milstein scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2 ,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}				  
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Milstein2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}

.MilsteinS2D <-
function(N,T=1,t0,x0,y0,Dt,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))



DDAx   <- D(driftx,"x")
DDDAx  <- D(D(driftx,"x"),"x")

DDSx   <- D(diffx,"x")
DDDSx  <- D(D(diffx,"x"),"x")

Ax     <- function(t,x,y)  eval(driftx)
DAxx   <- function(t,x,y)  eval(DDAx)
DAxxx  <- function(t,x,y)  eval(DDDAx)
Sx     <- function(t,x,y)  eval(diffx)
DSx    <- function(t,x,y)  eval(DDSx)
DSxx   <- function(t,x,y)  eval(DDDSx)

DDAy   <- D(drifty,"y")
DDDAy  <- D(D(drifty,"y"),"y")
DDSy   <- D(diffy,"y")
DDDSy  <- D(D(diffy,"y"),"y")
Ay     <- function(t,x,y)  eval(drifty)
DAyy   <- function(t,x,y)  eval(DDAy)
DAyyy  <- function(t,x,y)  eval(DDDAy)
Sy     <- function(t,x,y)  eval(diffy)
DSy    <- function(t,x,y)  eval(DDSy)
DSyy   <- function(t,x,y)  eval(DDDSy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1] +
       0.5 *Sx(t[i-1],X[i-1],Y[i-1]) * DSx(t[i-1],X[i-1],Y[i-1])*(Dx[i-1]^2-Dt)+ 
       Dt^(3/2)*(0.5 *Ax(t[i-1],X[i-1],Y[i-1])*DSx(t[i-1],X[i-1],Y[i-1]) +
       0.5 *DAxx(t[i-1],X[i-1],Y[i-1])*Sx(t[i-1],X[i-1],Y[i-1])+
       0.25 *(Sx(t[i-1],X[i-1],Y[i-1])^2) * DSxx(t[i-1],X[i-1],Y[i-1]))*Dx[i -1]+ 
       (Dt^2) * (0.5*Ax(t[i-1],X[i-1],Y[i-1])*DAxx(t[i-1],X[i-1],Y[i-1])+
       0.25 *DAxxx(t[i-1],X[i-1],Y[i-1])*(Sx(t[i-1],X[i-1],Y[i-1])^2))

Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1] +
       0.5 *Sy(t[i-1],X[i-1],Y[i-1]) * DSy(t[i-1],X[i-1],Y[i-1])*(Dy[i-1]^2-Dt)+ 
       Dt^(3/2)*(0.5 *Ay(t[i-1],X[i-1],Y[i-1])*DSy(t[i-1],X[i-1],Y[i-1]) +
       0.5 *DAyy(t[i-1],X[i-1],Y[i-1])*Sy(t[i-1],X[i-1],Y[i-1])+
       0.25 *(Sy(t[i-1],X[i-1],Y[i-1])^2) * DSyy(t[i-1],X[i-1],Y[i-1]))*Dy[i -1]+ 
       (Dt^2) * (0.5*Ay(t[i-1],X[i-1],Y[i-1])*DAyy(t[i-1],X[i-1],Y[i-1])+
       0.25 *DAyyy(t[i-1],X[i-1],Y[i-1])*(Sy(t[i-1],X[i-1],Y[i-1])^2))
                  } 

if(Step==FALSE){
plot(X,Y,type="l",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
mtext(expression("Second Milstein scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
if(Step==TRUE){
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Second Milstein scheme : Simulation SDE Two-Dimensional"),line=3.4,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2 ,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}					  
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "MilsteinS2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}

.Heun2D <-
function(N,T=1,t0,x0,y0,Dt,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))

Ax    <- function(t,x,y)  eval(driftx)
Ay    <- function(t,x,y)  eval(drifty)



Sx    <- function(t,x,y)  eval(diffx)
Sy    <- function(t,x,y)  eval(diffy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
XX   <- numeric()
YY   <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
         XX[i-1]= X[i-1]+Ax(t[i-1],X[i-1],Y[i-1])*Dt+Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1]
         YY[i-1]= Y[i-1]+Ay(t[i-1],X[i-1],Y[i-1])*Dt+Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1]
         X[i]   = X[i-1]+0.5*Dt*(Ax(t[i-1],X[i-1],Y[i-1])+Ax(t[i-1],XX[i-1],Y[i-1]))+
                 0.5*(Sx(t[i-1],X[i-1],Y[i-1])+Sx(t[i-1],XX[i-1],Y[i-1]))*Dx[i-1]
         Y[i]   = Y[i-1]+0.5*Dt*(Ay(t[i-1],X[i-1],Y[i-1])+Ay(t[i-1],X[i-1],YY[i-1]))+
                 0.5*(Sy(t[i-1],X[i-1],Y[i-1])+Sy(t[i-1],X[i-1],YY[i-1]))*Dy[i-1]
                  } 
				  
if(Step==FALSE){
plot(X,Y,type="l",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
mtext(expression("Heun scheme : Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
if(Step==TRUE){
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Heun scheme : Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2 ,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}					  
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Heun2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}

.RK32D <-
function(N,T=1,t0,x0,y0,Dt,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))

Ax    <- function(t,x,y)  eval(driftx)
Ay    <- function(t,x,y)  eval(drifty)

Sx    <- function(t,x,y)  eval(diffx)
Sy    <- function(t,x,y)  eval(diffy)


if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
X    <- numeric()
Y    <- numeric()
XX   <- numeric()
YY   <- numeric()
XXX  <- numeric()
YYY  <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
              XX[i-1]=X[i-1]+0.5*Dt*Ax(t[i-1],X[i-1],Y[i-1])+Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1]
              YY[i-1]=Y[i-1]+0.5*Dt*Ay(t[i-1],X[i-1],Y[i-1])+Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1]
              XXX[i-1]=X[i-1]-Ax(t[i-1],X[i-1],Y[i-1])*Dt+2*Dt*Ax(t[i-1]+0.5*Dt,XX[i-1],Y[i-1])+
                     (2*Sx(t[i-1]+0.5*Dt,XX[i-1],Y[i-1])-Sx(t[i-1],X[i-1],Y[i-1]))*Dx[i-1]
              YYY[i-1]=Y[i-1]-Ay(t[i-1],X[i-1],Y[i-1])*Dt+2*Dt*Ay(t[i-1]+0.5*Dt,X[i-1],YY[i-1])+
                     (2*Sy(t[i-1]+0.5*Dt,X[i-1],YY[i-1])-Sy(t[i-1],X[i-1],Y[i-1]))*Dy[i-1]
              X[i] = X[i-1]+(Dt/6)*(Ax(t[i-1],X[i-1],Y[i-1])+4*Ax(t[i-1]+0.5*Dt,XX[i-1],Y[i-1])+Ax(t[i-1]+Dt,XXX[i-1],Y[i-1]))+
                     (1/6)*(Sx(t[i-1],X[i-1],Y[i-1])+4*Sx(t[i-1]+0.5*Dt,XX[i-1],Y[i-1])+Sx(t[i-1]+Dt,XXX[i-1],Y[i-1]))*Dx[i-1]
              Y[i] = Y[i-1]+(Dt/6)*(Ay(t[i-1],X[i-1],Y[i-1])+4*Ay(t[i-1]+0.5*Dt,X[i-1],YY[i-1])+Ay(t[i-1]+Dt,X[i-1],YYY[i-1]))+
                     (1/6)*(Sy(t[i-1],X[i-1],Y[i-1])+4*Sy(t[i-1]+0.5*Dt,X[i-1],YY[i-1])+Sy(t[i-1]+Dt,X[i-1],YYY[i-1]))*Dy[i-1]
                  } 

if(Step==FALSE){
plot(X,Y,type="l",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
mtext(expression("Runge-Kutta scheme Order3: Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
if(Step==TRUE){
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Runge-Kutta scheme Order3: Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2 ,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}					  
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "Heun2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}

.STS2D <-
function(N,T=1,t0,x0,y0,Dt,driftx,drifty,diffx,diffy,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y)" ),icon="error"))



DDAx   <- D(driftx,"x")
DDDAx  <- D(D(driftx,"x"),"x")

DDSx   <- D(diffx,"x")
DDDSx  <- D(D(diffx,"x"),"x")
Ax     <- function(t,x,y)  eval(driftx)
DAxx   <- function(t,x,y)  eval(DDAx)
DAxxx  <- function(t,x,y)  eval(DDDAx)
Sx     <- function(t,x,y)  eval(diffx)
DSx    <- function(t,x,y)  eval(DDSx)
DSxx   <- function(t,x,y)  eval(DDDSx)

DDAy   <- D(drifty,"y")
DDDAy  <- D(D(drifty,"y"),"y")
DDSy   <- D(diffy,"y")
DDDSy  <- D(D(diffy,"y"),"y")
Ay     <- function(t,x,y)  eval(drifty)
DAyy   <- function(t,x,y)  eval(DDAy)
DAyyy  <- function(t,x,y)  eval(DDDAy)
Sy     <- function(t,x,y)  eval(diffy)
DSy    <- function(t,x,y)  eval(DDSy)
DSyy   <- function(t,x,y)  eval(DDDSy)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
DZx= rnorm(N,0,sqrt((1/3)*Dt^3))
DZy= rnorm(N,0,sqrt((1/3)*Dt^3))
X    <- numeric()
Y    <- numeric()
X[1] <- x0
Y[1] <- y0
for (i in 2:(N+1)){
X[i]=X[i-1]+Ax(t[i-1],X[i-1],Y[i-1])*Dt+Sx(t[i-1],X[i-1],Y[i-1])*Dx[i-1]+
     0.5*Sx(t[i-1],X[i-1],Y[i-1])*DSx(t[i-1],X[i-1],Y[i-1])*((Dx[i-1]^2)-Dt)+
     DAxx(t[i-1],X[i-1],Y[i-1])*Sx(t[i-1],X[i-1],Y[i-1])*DZx[i-1]+0.5*(Ax(t[i-1],X[i-1],Y[i-1])*DAxx(t[i-1],X[i-1],Y[i-1])+
     0.5*(Sx(t[i-1],X[i-1],Y[i-1])^2)*DAxxx(t[i-1],X[i-1],Y[i-1]))*(Dt^2)+(Ax(t[i-1],X[i-1],Y[i-1])*DSx(t[i-1],X[i-1],Y[i-1])+
     0.5*(Sx(t[i-1],X[i-1],Y[i-1])^2)*DSxx(t[i-1],X[i-1],Y[i-1]))*(Dx[i-1]*Dt-DZx[i-1])+
     0.5*Sx(t[i-1],X[i-1],Y[i-1])*(Sx(t[i-1],X[i-1],Y[i-1])*DSxx(t[i-1],X[i-1],Y[i-1])+
     (DSx(t[i-1],X[i-1],Y[i-1])^2))*((1/3)*(Dx[i-1]^2)-Dt)*Dx[i-1]
Y[i]=Y[i-1]+Ay(t[i-1],X[i-1],Y[i-1])*Dt+Sy(t[i-1],X[i-1],Y[i-1])*Dy[i-1]+
     0.5*Sy(t[i-1],X[i-1],Y[i-1])*DSy(t[i-1],X[i-1],Y[i-1])*((Dy[i-1]^2)-Dt)+
     DAyy(t[i-1],X[i-1],Y[i-1])*Sy(t[i-1],X[i-1],Y[i-1])*DZy[i-1]+0.5*(Ay(t[i-1],X[i-1],Y[i-1])*DAyy(t[i-1],X[i-1],Y[i-1])+
     0.5*(Sy(t[i-1],X[i-1],Y[i-1])^2)*DAyyy(t[i-1],X[i-1],Y[i-1]))*(Dt^2)+(Ay(t[i-1],X[i-1],Y[i-1])*DSy(t[i-1],X[i-1],Y[i-1])+
     0.5*(Sy(t[i-1],X[i-1],Y[i-1])^2)*DSyy(t[i-1],X[i-1],Y[i-1]))*(Dy[i-1]*Dt-DZy[i-1])+
     0.5*Sy(t[i-1],X[i-1],Y[i-1])*(Sy(t[i-1],X[i-1],Y[i-1])*DSyy(t[i-1],X[i-1],Y[i-1])+
     (DSy(t[i-1],X[i-1],Y[i-1])^2))*((1/3)*(Dy[i-1]^2)-Dt)*Dy[i-1]
                  } 
				  
if(Step==FALSE){
plot(X,Y,type="l",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
mtext(expression("Strong Taylor Scheme Order 1.5: Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
if(Step==TRUE){
plot(X,Y,type="n",xlab=expression(X[t]^1),ylab=expression(X[t]^2),las=1)
points(x0,y0,type="p",pch=20,col="red2",cex=1.4)
for (i in 1:N){lines(c(X[i],X[i+1]),c(Y[i],Y[i+1]),type="l",col="black",lwd=1)}
mtext(expression("Strong Taylor Scheme Order 1.5: Simulation SDE Two-Dimensional"),line=3.2,adj=0.5,cex=1,col="black")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=1.6,col="red3")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="red3")
mtext(bquote(X[t[0]]^1==.(x0)),line=1.6,adj=0.78,cex=1,col="blue")
mtext(bquote(X[t[0]]^2==.(y0)),line=0.1,adj=0.78,cex=1,col="blue")
mtext(bquote(T==.(T)),line=1.9,cex=1,adj=1,col="blue")
mtext(bquote(Delta*t==.(Dt)),line=0.4,cex=1,adj=1,col="blue")
legend("topleft",border="gray",c("(X0,Y0)"),pch=c(20),col=c("red2"))
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
X11(6,6)
par( mar =c(3 ,3 ,2 ,1))
par(mfrow=c(2,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2)*dt + sigma[1](t,X[t]^1,X[t]^2) *d*W[t]^1),cex=1,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2)*dt + sigma[2](t,X[t]^1,X[t]^2) *d*W[t]^2),cex=1,adj=0,line=0.1,col="blue")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}					  
time <- t
X1   <- X
X2   <- Y
Result <- data.frame(time,X1,X2)
showData(Result , placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Result, "MilsteinS2D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
}
attach(Result)
}

##############################################################################################################################
##############################################################################################################################
##############################################################################################################################
.STS3D <-
function(N,T=1,t0,x0,y0,z0,Dt,driftx,drifty,driftz,diffx,diffy,diffz,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty) || !is.expression(driftz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y,Z)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy) || !is.expression(diffz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y,Z)" ),icon="error"))

DDAx   <- D(driftx,"x")
DDDAx  <- D(D(driftx,"x"),"x")
DDSx   <- D(diffx,"x")
DDDSx  <- D(D(diffx,"x"),"x")
Ax     <- function(t,x,y,z)  eval(driftx)
DAxx   <- function(t,x,y,z)  eval(DDAx)
DAxxx  <- function(t,x,y,z)  eval(DDDAx)
Sx     <- function(t,x,y,z)  eval(diffx)
DSx    <- function(t,x,y,z)  eval(DDSx)
DSxx   <- function(t,x,y,z)  eval(DDDSx)

DDAy   <- D(drifty,"y")
DDDAy  <- D(D(drifty,"y"),"y")
DDSy   <- D(diffy,"y")
DDDSy  <- D(D(diffy,"y"),"y")
Ay     <- function(t,x,y,z)  eval(drifty)
DAyy   <- function(t,x,y,z)  eval(DDAy)
DAyyy  <- function(t,x,y,z)  eval(DDDAy)
Sy     <- function(t,x,y,z)  eval(diffy)
DSy    <- function(t,x,y,z)  eval(DDSy)
DSyy   <- function(t,x,y,z)  eval(DDDSy)

DDAz   <- D(driftz,"z")
DDDAz  <- D(D(driftz,"z"),"z")
DDSz   <- D(diffz,"z")
DDDSz  <- D(D(diffz,"z"),"z")
Az     <- function(t,x,y,z)  eval(driftz)
DAzz   <- function(t,x,y,z)  eval(DDAz)
DAzzz  <- function(t,x,y,z)  eval(DDDAz)
Sz     <- function(t,x,y,z)  eval(diffz)
DSz    <- function(t,x,y,z)  eval(DDSz)
DSzz   <- function(t,x,y,z)  eval(DDDSz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
DZx= rnorm(N,0,sqrt((1/3)*Dt^3))
DZy= rnorm(N,0,sqrt((1/3)*Dt^3))
DZz= rnorm(N,0,sqrt((1/3)*Dt^3))
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
X[i]=X[i-1]+Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]+
     0.5*Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSx(t[i-1],X[i-1],Y[i-1],Z[i-1])*((Dx[i-1]^2)-Dt)+
     DAxx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*DZx[i-1]+0.5*(Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*DAxx(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     0.5*(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])^2)*DAxxx(t[i-1],X[i-1],Y[i-1],Z[i-1]))*(Dt^2)+(Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSx(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     0.5*(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])^2)*DSxx(t[i-1],X[i-1],Y[i-1],Z[i-1]))*(Dx[i-1]*Dt-DZx[i-1])+
     0.5*Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSxx(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     (DSx(t[i-1],X[i-1],Y[i-1],Z[i-1])^2))*((1/3)*(Dx[i-1]^2)-Dt)*Dx[i-1]
Y[i]=Y[i-1]+Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1]+
     0.5*Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSy(t[i-1],X[i-1],Y[i-1],Z[i-1])*((Dy[i-1]^2)-Dt)+
     DAyy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*DZy[i-1]+0.5*(Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*DAyy(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     0.5*(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])^2)*DAyyy(t[i-1],X[i-1],Y[i-1],Z[i-1]))*(Dt^2)+(Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSy(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     0.5*(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])^2)*DSyy(t[i-1],X[i-1],Y[i-1],Z[i-1]))*(Dy[i-1]*Dt-DZy[i-1])+
     0.5*Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSyy(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     (DSx(t[i-1],X[i-1],Y[i-1],Z[i-1])^2))*((1/3)*(Dy[i-1]^2)-Dt)*Dy[i-1]
Z[i]=Z[i-1]+Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1]+
     0.5*Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSz(t[i-1],X[i-1],Y[i-1],Z[i-1])*((Dz[i-1]^2)-Dt)+
     DAzz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*DZz[i-1]+0.5*(Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*DAzz(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     0.5*(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])^2)*DAzzz(t[i-1],X[i-1],Y[i-1],Z[i-1]))*(Dt^2)+(Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSz(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     0.5*(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])^2)*DSzz(t[i-1],X[i-1],Y[i-1],Z[i-1]))*(Dz[i-1]*Dt-DZz[i-1])+
     0.5*Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSzz(t[i-1],X[i-1],Y[i-1],Z[i-1])+
     (DSz(t[i-1],X[i-1],Y[i-1],Z[i-1])^2))*((1/3)*(Dz[i-1]^2)-Dt)*Dz[i-1]
                  } 
G <- data.frame(X,Y,Z)
if(Step==FALSE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
lines3d(G[,1],G[,2],G[,3],col="black",from ="lines",lwd=2)
title3d(family=c("serif"),main="Strong Taylor Scheme Order 1.5 : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Strong Taylor Scheme Order 1.5 : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
Diff3D <- data.frame(t,X,Y,Z)
showData(Diff3D, placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Diff3D , "SYS_Diff3D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
                 }
attach(Diff3D)
}

.RK33D <-
function(N,T=1,t0,x0,y0,z0,Dt,driftx,drifty,driftz,diffx,diffy,diffz,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty) || !is.expression(driftz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y,Z)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy) || !is.expression(diffz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y,Z)" ),icon="error"))

Ax    <- function(t,x,y,z)  eval(driftx)
Ay    <- function(t,x,y,z)  eval(drifty)
Az    <- function(t,x,y,z)  eval(driftz)
Sx    <- function(t,x,y,z)  eval(diffx)
Sy    <- function(t,x,y,z)  eval(diffy)
Sz    <- function(t,x,y,z)  eval(diffz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
XX   <- numeric()
YY   <- numeric()
ZZ   <- numeric()
XXX  <- numeric()
YYY  <- numeric()
ZZZ  <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
              XX[i-1]=X[i-1]+0.5*Dt*Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])+Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]
              YY[i-1]=Y[i-1]+0.5*Dt*Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])+Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1]
              ZZ[i-1]=Z[i-1]+0.5*Dt*Az(t[i-1],X[i-1],Y[i-1],Z[i-1])+Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1]
              XXX[i-1]=X[i-1]-Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+2*Dt*Ax(t[i-1]+0.5*Dt,XX[i-1],Y[i-1],Z[i-1])+
                     (2*Sx(t[i-1]+0.5*Dt,XX[i-1],Y[i-1],Z[i-1])-Sx(t[i-1],X[i-1],Y[i-1],Z[i-1]))*Dx[i-1]
              YYY[i-1]=Y[i-1]-Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+2*Dt*Ay(t[i-1]+0.5*Dt,X[i-1],YY[i-1],Z[i-1])+
                     (2*Sy(t[i-1]+0.5*Dt,X[i-1],YY[i-1],Z[i-1])-Sy(t[i-1],X[i-1],Y[i-1],Z[i-1]))*Dy[i-1]
              ZZZ[i-1]=Z[i-1]-Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+2*Dt*Az(t[i-1]+0.5*Dt,X[i-1],Y[i-1],ZZ[i-1])+
                     (2*Sz(t[i-1]+0.5*Dt,X[i-1],Y[i-1],ZZ[i-1])-Sz(t[i-1],X[i-1],Y[i-1],Z[i-1]))*Dz[i-1]
              X[i] = X[i-1]+(Dt/6)*(Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])+4*Ax(t[i-1]+0.5*Dt,XX[i-1],Y[i-1],Z[i-1])+Ax(t[i-1]+Dt,XXX[i-1],Y[i-1],Z[i-1]))+
                     (1/6)*(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])+4*Sx(t[i-1]+0.5*Dt,XX[i-1],Y[i-1],Z[i-1])+Sx(t[i-1]+Dt,XXX[i-1],Y[i-1],Z[i-1]))*Dx[i-1]
              Y[i] = Y[i-1]+(Dt/6)*(Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])+4*Ay(t[i-1]+0.5*Dt,X[i-1],YY[i-1],Z[i-1])+Ay(t[i-1]+Dt,X[i-1],YYY[i-1],Z[i-1]))+
                     (1/6)*(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])+4*Sy(t[i-1]+0.5*Dt,X[i-1],YY[i-1],Z[i-1])+Sy(t[i-1]+Dt,X[i-1],YYY[i-1],Z[i-1]))*Dy[i-1]
              Z[i] = Z[i-1]+(Dt/6)*(Az(t[i-1],X[i-1],Y[i-1],Z[i-1])+4*Az(t[i-1]+0.5*Dt,X[i-1],Y[i-1],ZZ[i-1])+Az(t[i-1]+Dt,X[i-1],Y[i-1],ZZZ[i-1]))+
                     (1/6)*(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])+4*Sz(t[i-1]+0.5*Dt,X[i-1],Y[i-1],ZZ[i-1])+Sz(t[i-1]+Dt,X[i-1],Y[i-1],ZZZ[i-1]))*Dz[i-1]
                  } 
G <- data.frame(X,Y,Z)
if(Step==FALSE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
lines3d(G[,1],G[,2],G[,3],col="black",from ="lines",lwd=2)
title3d(family=c("serif"),main="Runge-Kutta scheme Order3 : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Runge-Kutta scheme Order3 : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
Diff3D <- data.frame(t,X,Y,Z)
showData(Diff3D, placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Diff3D , "RK3_Diff3D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
                 }
attach(Diff3D)
}

.Heun3D <-
function(N,T=1,t0,x0,y0,z0,Dt,driftx,drifty,driftz,diffx,diffy,diffz,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty) || !is.expression(driftz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y,Z)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy) || !is.expression(diffz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y,Z)" ),icon="error"))

Ax    <- function(t,x,y,z)  eval(driftx)
Ay    <- function(t,x,y,z)  eval(drifty)
Az    <- function(t,x,y,z)  eval(driftz)
Sx    <- function(t,x,y,z)  eval(diffx)
Sy    <- function(t,x,y,z)  eval(diffy)
Sz    <- function(t,x,y,z)  eval(diffz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
XX   <- numeric()
YY   <- numeric()
ZZ   <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
         XX[i-1]= X[i-1]+Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]
         YY[i-1]= Y[i-1]+Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1]
         ZZ[i-1]= Z[i-1]+Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt+Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1]
         X[i]   = X[i-1]+0.5*Dt*(Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])+Ax(t[i-1],XX[i-1],Y[i-1],Z[i-1]))+
                 0.5*(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])+Sx(t[i-1],XX[i-1],Y[i-1],Z[i-1]))*Dx[i-1]
         Y[i]   = Y[i-1]+0.5*Dt*(Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])+Ay(t[i-1],X[i-1],YY[i-1],Z[i-1]))+
                 0.5*(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])+Sy(t[i-1],X[i-1],YY[i-1],Z[i-1]))*Dy[i-1]
         Z[i]   = Z[i-1]+0.5*Dt*(Az(t[i-1],X[i-1],Y[i-1],Z[i-1])+Az(t[i-1],X[i-1],Y[i-1],ZZ[i-1]))+
                 0.5*(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])+Sz(t[i-1],X[i-1],Y[i-1],ZZ[i-1]))*Dz[i-1]
                  } 
G <- data.frame(X,Y,Z)
if(Step==FALSE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
lines3d(G[,1],G[,2],G[,3],col="black",from ="lines",lwd=2)
title3d(family=c("serif"),main="Heun scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Heun scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
Diff3D <- data.frame(t,X,Y,Z)
showData(Diff3D, placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Diff3D , "Heun_Diff3D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
                 }
attach(Diff3D)
}

.MilsteinS3D  <-
function(N,T=1,t0,x0,y0,z0,Dt,driftx,drifty,driftz,diffx,diffy,diffz,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty) || !is.expression(driftz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y,Z)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy) || !is.expression(diffz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y,Z)" ),icon="error"))

DDAx   <- D(driftx,"x")
DDDAx  <- D(D(driftx,"x"),"x")
DDSx   <- D(diffx,"x")
DDDSx  <- D(D(diffx,"x"),"x")
Ax     <- function(t,x,y,z)  eval(driftx)
DAxx   <- function(t,x,y,z)  eval(DDAx)
DAxxx  <- function(t,x,y,z)  eval(DDDAx)
Sx     <- function(t,x,y,z)  eval(diffx)
DSx    <- function(t,x,y,z)  eval(DDSx)
DSxx   <- function(t,x,y,z)  eval(DDDSx)

DDAy   <- D(drifty,"y")
DDDAy  <- D(D(drifty,"y"),"y")
DDSy   <- D(diffy,"y")
DDDSy  <- D(D(diffy,"y"),"y")
Ay     <- function(t,x,y,z)  eval(drifty)
DAyy   <- function(t,x,y,z)  eval(DDAy)
DAyyy  <- function(t,x,y,z)  eval(DDDAy)
Sy     <- function(t,x,y,z)  eval(diffy)
DSy    <- function(t,x,y,z)  eval(DDSy)
DSyy   <- function(t,x,y,z)  eval(DDDSy)

DDAz   <- D(driftz,"z")
DDDAz  <- D(D(driftz,"z"),"z")
DDSz   <- D(diffz,"z")
DDDSz  <- D(D(diffz,"z"),"z")
Az     <- function(t,x,y,z)  eval(driftz)
DAzz   <- function(t,x,y,z)  eval(DDAz)
DAzzz  <- function(t,x,y,z)  eval(DDDAz)
Sz     <- function(t,x,y,z)  eval(diffz)
DSz    <- function(t,x,y,z)  eval(DDSz)
DSzz   <- function(t,x,y,z)  eval(DDDSz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1] +
       0.5 *Sx(t[i-1],X[i-1],Y[i-1],Z[i-1]) * DSx(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Dx[i-1]^2-Dt)+ 
       Dt^(3/2)*(0.5 *Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSx(t[i-1],X[i-1],Y[i-1],Z[i-1]) +
       0.5 *DAxx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])+
       0.25 *(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])^2) * DSxx(t[i-1],X[i-1],Y[i-1],Z[i-1]))*Dx[i -1]+ 
       (Dt^2) * (0.5*Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*DAxx(t[i-1],X[i-1],Y[i-1],Z[i-1])+
       0.25 *DAxxx(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])^2))

Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1] +
       0.5 *Sy(t[i-1],X[i-1],Y[i-1],Z[i-1]) * DSy(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Dy[i-1]^2-Dt)+ 
       Dt^(3/2)*(0.5 *Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSy(t[i-1],X[i-1],Y[i-1],Z[i-1]) +
       0.5 *DAyy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])+
       0.25 *(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])^2) * DSyy(t[i-1],X[i-1],Y[i-1],Z[i-1]))*Dy[i -1]+ 
       (Dt^2) * (0.5*Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*DAyy(t[i-1],X[i-1],Y[i-1],Z[i-1])+
       0.25 *DAyyy(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])^2))

Z[i] = Z[i-1] + Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1] +
       0.5 *Sz(t[i-1],X[i-1],Y[i-1],Z[i-1]) * DSz(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Dz[i-1]^2-Dt)+ 
       Dt^(3/2)*(0.5 *Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSz(t[i-1],X[i-1],Y[i-1],Z[i-1]) +
       0.5 *DAzz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])+
       0.25 *(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])^2) * DSzz(t[i-1],X[i-1],Y[i-1],Z[i-1]))*Dz[i -1]+ 
       (Dt^2) * (0.5*Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*DAzz(t[i-1],X[i-1],Y[i-1],Z[i-1])+
       0.25 *DAzzz(t[i-1],X[i-1],Y[i-1],Z[i-1])*(Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])^2))
                  } 
G <- data.frame(X,Y,Z)
if(Step==FALSE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
lines3d(G[,1],G[,2],G[,3],col="black",from ="lines",lwd=2)
title3d(family=c("serif"),main="Second Milstein scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Second Milstein scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
Diff3D <- data.frame(t,X,Y,Z)
showData(Diff3D, placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Diff3D , "MilsteinS_Diff3D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
                 }
attach(Diff3D)
}

.Milstein3D  <-
function(N,T=1,t0,x0,y0,z0,Dt,driftx,drifty,driftz,diffx,diffy,diffz,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty) || !is.expression(driftz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y,Z)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy) || !is.expression(diffz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y,Z)" ),icon="error"))

DSxx   <- D(diffx,"x")
DSyy   <- D(diffy,"y")
DSzz   <- D(diffz,"z")			
			
Ax    <- function(t,x,y,z)  eval(driftx)
Ay    <- function(t,x,y,z)  eval(drifty)
Az    <- function(t,x,y,z)  eval(driftz)
Sx    <- function(t,x,y,z)  eval(diffx)
Sy    <- function(t,x,y,z)  eval(diffy)
Sz    <- function(t,x,y,z)  eval(diffz)
DSx   <- function(t,x,y,z)  eval(DSxx)
DSy   <- function(t,x,y,z)  eval(DSyy)
DSz   <- function(t,x,y,z)  eval(DSzz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
    X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]+
           0.5 *Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSx(t[i-1],X[i-1],Y[i-1],Z[i-1])*((Dx[i-1])^2 -Dt)
    Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1]+
           0.5 *Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSy(t[i-1],X[i-1],Y[i-1],Z[i-1])*((Dy[i-1])^2 -Dt) 
    Z[i] = Z[i-1] + Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1]+
           0.5 *Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*DSz(t[i-1],X[i-1],Y[i-1],Z[i-1])*((Dz[i-1])^2 -Dt) 
                  }
G <- data.frame(X,Y,Z)
if(Step==FALSE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
lines3d(G[,1],G[,2],G[,3],col="black",from ="lines",lwd=2)
title3d(family=c("serif"),main="Milstein scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Milstein scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
Diff3D <- data.frame(t,X,Y,Z)
showData(Diff3D, placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Diff3D , "Milstein_Diff3D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
                 }
attach(Diff3D)
}

.Euler3D <-
function(N,T=1,t0,x0,y0,z0,Dt,driftx,drifty,driftz,diffx,diffy,diffz,Step=FALSE,Output=FALSE)
       {
if( t0 >= T || t0 < 0 ) 
            stop(tkmessageBox(title="Error",message=paste( "T > t0 >= 0" ),icon="error"))

if( N <= 1 )   
            stop(tkmessageBox(title="Error",message=paste( " N must be very large N >>> 0" ),icon="error"))

if ( Dt <= 0 )
            stop(tkmessageBox(title="Error",message=paste( "Dt > 0" ),icon="error"))

if(!is.expression(driftx) || !is.expression(drifty) || !is.expression(driftz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of drift must be expressions f(t,X,Y,Z)" ),icon="error"))

if(!is.expression(diffx) || !is.expression(diffy) || !is.expression(diffz))
            stop(tkmessageBox(title="Error",message=paste( "The coefficients of diffusion must be expressions f(t,X,Y,Z)" ),icon="error"))

Ax    <- function(t,x,y,z)  eval(driftx)
Ay    <- function(t,x,y,z)  eval(drifty)
Az    <- function(t,x,y,z)  eval(driftz)
Sx    <- function(t,x,y,z)  eval(diffx)
Sy    <- function(t,x,y,z)  eval(diffy)
Sz    <- function(t,x,y,z)  eval(diffz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
    X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]
    Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1] 
	Z[i] = Z[i-1] + Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1] 
                  } 
G <- data.frame(X,Y,Z)
if(Step==FALSE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
lines3d(G[,1],G[,2],G[,3],col="black",from ="lines",lwd=2)
title3d(family=c("serif"),main="Euler scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}

if(Step==TRUE){
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Euler scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Tue Sep 27 23:39:49 2011',color = c("blue"),cex=0.8)
par( mar =c(3 ,3 ,3 ,1))
par(mfrow=c(3,1))
plot(t,X,type="l",xlab=expression(time),ylab=expression(X[t]^1),las=1,col="red")
mtext(bquote(dX[t]^1== a[1](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[1](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^1),cex=0.8,adj=0,line=0.1,col="red")
plot(t,Y,type="l",xlab=expression(time),ylab=expression(X[t]^2),las=1,col="blue")
mtext(bquote(dX[t]^2== a[2](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[2](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^2),cex=0.8,adj=0,line=0.1,col="blue")
plot(t,Z,type="l",xlab=expression(time),ylab=expression(X[t]^3),las=1,col="green4")
mtext(bquote(dX[t]^3== a[3](t,X[t]^1,X[t]^2,X[t]^3)*dt + sigma[3](t,X[t]^1,X[t]^2,X[t]^3) *d*W[t]^3),cex=0.8,adj=0,line=0.1,col="green4")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Wed Jan 26 20:51:28 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
}
Diff3D <- data.frame(t,X,Y,Z)
showData(Diff3D, placement='+200-200', font = "Courier 11", body.textcolor = "black")
if(Output==TRUE){
write.xlsx(Diff3D , "Euler_Diff3D.xlsx", sheetName="Sheet 1",
           col.names=TRUE, row.names=FALSE, append=FALSE)
                 }
attach(Diff3D)
}

.Euler3DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n                Euler Scheme ?\n Simulation SDE Three-Dimensional",command=function(){print(help("snssde3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.Euler3D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=15,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Milstein3DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n                Milstein Scheme ?\n Simulation SDE Three-Dimensional",command=function(){print(help("snssde3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.Milstein3D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=15,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.MilsteinS3DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n          Second Milstein scheme ?\n Simulation SDE Three-Dimensional",command=function(){print(help("snssde3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.MilsteinS3D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=15,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Heun3DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n                Heun scheme ?\n Simulation SDE Three-Dimensional",command=function(){print(help("snssde3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.Heun3D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=15,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.RK33DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n    Runge-Kutta scheme Order3 ?\n Simulation SDE Three-Dimensional",command=function(){print(help("snssde3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.RK33D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=15,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.STS3DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n   Strong Taylor Scheme Order 1.5 ?\n Simulation SDE Three-Dimensional",command=function(){print(help("snssde3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(.STS3D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=15,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=15,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=16,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=16,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.PredCorr3DGUI <-
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
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
but <- tkbutton(tt,text=" Simulation for Numerical Solution\n   Predictor-Corrector Method ?\n Simulation SDE Three-Dimensional",command=function(){print(help("PredCorr3D"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

N  <- tclVar(5000)
T  <- tclVar(1)
t0 <- tclVar(0)
x0 <- tclVar(0)
y0 <- tclVar(0)
z0 <- tclVar(0)
Dt <- tclVar(0.001)
driftx <- tclVar("expression(cos(t*x*y))")
drifty <- tclVar("expression(cos(t))")
driftz <- tclVar("expression(cos(t*x))")
diffx  <- tclVar("expression(0.1)")
diffy  <- tclVar("expression(0.1)")
diffz  <- tclVar("expression(0.1)")
Step   <- tclVar("FALSE")
Output <- tclVar("FALSE")
alpha <- tclVar(0.5)
mu    <- tclVar(0.5)
reset <- function()
        {
         tclvalue(N)       <-""
         tclvalue(y0)      <-""
         tclvalue(t0)      <-""
         tclvalue(T)       <-""
         tclvalue(x0)      <-""
         tclvalue(z0)      <-""
         tclvalue(Dt)      <-""
         tclvalue(alpha)   <-"0.5"
         tclvalue(mu)      <-"0.5"
         tclvalue(driftx)  <-"expression(     )"
         tclvalue(drifty)  <-"expression(     )"
         tclvalue(driftz)  <-"expression(     )"
         tclvalue(diffx)   <-"expression(     )"
         tclvalue(diffy)   <-"expression(     )"
         tclvalue(diffz)   <-"expression(     )"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Step)  <-"FALSE"
         }
tkentry        <- ttkentry
N.entry        <- tkentry(tt, textvariable=N,width = 30)
y0.entry       <- tkentry(tt, textvariable=y0,width = 30)
z0.entry       <- tkentry(tt, textvariable=z0,width = 30)
t0.entry       <- tkentry(tt, textvariable=t0,width = 30)
T.entry        <- tkentry(tt, textvariable=T,width = 30)
x0.entry       <- tkentry(tt, textvariable=x0,width = 30)
Dt.entry       <- tkentry(tt, textvariable=Dt,width = 30)
driftx.entry   <- tkentry(tt, textvariable=driftx,width = 30)
drifty.entry   <- tkentry(tt, textvariable=drifty,width = 30)
driftz.entry   <- tkentry(tt, textvariable=driftz,width = 30)
diffx.entry    <- tkentry(tt, textvariable=diffx,width = 30)
diffy.entry    <- tkentry(tt, textvariable=diffy,width = 30)
diffz.entry    <- tkentry(tt, textvariable=diffz,width = 30)
alpha.entry    <- tkentry(tt, textvariable=alpha)
mu.entry       <- tkentry(tt, textvariable=mu)
Output.entry   <- tkentry(tt, textvariable=Output)
Step.entry     <- tkentry(tt, textvariable=Step)
USTHB <- function(...) 
        {
         if (is.null(N)) return()
         if (is.expression(driftx)) return()
         if (is.expression(drifty)) return()
         if (is.expression(driftz)) return()
         if (is.expression(diffx)) return()
         if (is.expression(diffy)) return()
         if (is.expression(diffz)) return()
         N      <- as.numeric(tclObj(N))
         y0     <- as.numeric(tclObj(y0))  
         z0     <- as.numeric(tclObj(z0)) 
         alpha  <- as.numeric(tclObj(alpha))
         mu     <- as.numeric(tclObj(mu))
         t0     <- as.numeric(tclObj(t0))
         T      <- as.numeric(tclObj(T))
         x0     <- as.numeric(tclObj(x0))
         Dt     <- as.numeric(tclObj(Dt))
         driftx  <- tclvalue(driftx)    
         drifty  <- tclvalue(drifty)   
         driftz  <- tclvalue(driftz)  
         diffx  <- tclvalue(diffx) 
         diffy  <- tclvalue(diffy) 
         diffz  <- tclvalue(diffz)
         e1     <- try(parse(text=driftx))
         e2     <- try(parse(text=diffx))
         e3     <- try(parse(text=drifty))
         e4     <- try(parse(text=diffy))
         e5     <- try(parse(text=driftz))
         e6     <- try(parse(text=diffz))
         Output <- as.character(tclObj(Output))
         Step   <- as.character(tclObj(Step))
        eval(substitute(PredCorr3D(N=N,t0=t0,T=1,x0=x0,y0=y0,z0=z0,Dt=Dt,alpha=alpha,mu=mu,driftx=eval(e1),drifty=eval(e3),driftz=eval(e5),diffx=eval(e2),diffy=eval(e4),diffz=eval(e6),Step=Step,Output=Output)))
        }
DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example N = 1000.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Size of process (N) : "), N.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Dt = (T-t0)/N = 0.1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Discretization (Dt) : "), Dt.entry, sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example T = 100.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Final time (T) : "), T.entry,sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

##DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Weight Alpha of the predictor-corrector scheme. ",icon="info",type="ok"))
tkgrid(tklabel(tt,text = "Alpha : "),sticky = "w")
SliderValueLabel <- tklabel(tt)
##tkgrid(tklabel(tt,text=""),row=7, column=1)
tkconfigure(SliderValueLabel,textvariable=alpha)
slider <- tkscale(tt,from=0, to=1,showvalue=TRUE, variable=alpha,
                   resolution=0.01, orient="horizontal")
tkgrid(slider,row=7, column = 1,sticky="ew")
##tkgrid(DimHlp.but, row=7, column=2,sticky="w")

##DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Weight Mu of the predictor-corrector scheme.  ",icon="info",type="ok"))
tkgrid(tklabel(tt,text = "Mu : "),sticky = "w")
SliderValueLabel1 <- tklabel(tt)
##tkgrid(tklabel(tt,text=""),row=8, column=1)
tkconfigure(SliderValueLabel1,textvariable=mu)
slider1 <- tkscale(tt,from=0, to=1,showvalue=TRUE, variable=mu,
                   resolution=0.01, orient="horizontal")
tkgrid(slider1,row=8, column = 1,sticky="ew")
##tkgrid(DimHlp.but, row=8, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(z*cos(t*x*y))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 1 : "), driftx.entry,sticky="w")
tkgrid(DimHlp.but, row=9, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 1: "), diffx.entry,sticky="w")
tkgrid(DimHlp.but, row=10, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example y0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (y0) : "), y0.entry, sticky="w")
tkgrid(DimHlp.but, row=11, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t*z))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 2 : "), drifty.entry,sticky="w")
tkgrid(DimHlp.but, row=12, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 2: "), diffy.entry,sticky="w")
tkgrid(DimHlp.but, row=13, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example z0 = 1.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (z0) : "), z0.entry, sticky="w")
tkgrid(DimHlp.but, row=14, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(cos(t))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien 3 : "), driftz.entry,sticky="w")
tkgrid(DimHlp.but, row=15, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of four variables t and x and y and z, Example (expression(0.1)). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient 3: "), diffz.entry,sticky="w")
tkgrid(DimHlp.but, row=16, column=2,sticky="w")

tkgrid(tklabel(tt,text = "Step by Step : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Step),row=17,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Step),row=17,column=1)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=18,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=18,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})   
}

.Codion <- function()
        {
x <- seq(-2.5,2.5,by=0.001)
t <- seq(0,10,by=0.01)
t0=0
x0=2
drift <- expression(-4*x)
diff  <- expression(sqrt(2*1))
A    <- function(t,x)  eval(drift)
S    <- function(t,x)  eval(diff)
for(i in 1:length(t)){
plot(x,dnorm (x, mean = x0 - A(t[i],x)*t[i], sd= sqrt(t[i])*S(t[i],x)),type="l",xlab="x",ylab=expression(bold(f(list(t,y)/x))),las=1)
mtext(bquote("Evolution Conditional Density at time":.(round(t[i],2))),line=2.5,cex=1.2,adj=0.5)
mtext(bquote("Langevin Equation":dX[t]==-a*X[t]*dt+sqrt(2*D)*dW[t]),line=0.8,cex=1.2,adj=0.5,col="red")
mtext(paste("USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Thu Sep 29 07:05:19 2011"),side = 1, line = 4, adj = 0.5, cex = .66)
                     }
}

.AppdconGUI <-
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
tkwm.title(tt, "Sim.DiffProc~~Statistical analysis")
tkwm.resizable(tt, 0,0)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)

but <- tkbutton(tt,text="Approximated Conditional Law \n        a Diffusion Process",command=function(){print(help("Appdcon"))},width=40)
tkgrid(but,row=1,columnspan = 3,sticky="ew")

x  <- tclVar("seq(0,3,by=0.001)")
t  <- tclVar("seq(0,3,by=0.01)")
t0 <- tclVar(0)
x0 <- tclVar(0)
drift <- tclVar("expression(1*(1-x))")
diff  <- tclVar("expression(0.3*x)")
Methods <- tclVar("Euler")
Output <- tclVar("FALSE")
reset <- function()
        {
         tclvalue(x)       <-"seq(-2,3,by=0.001)"
         tclvalue(t)       <-""
         tclvalue(t0)      <-"0"
         tclvalue(x0)      <-""
         tclvalue(drift)   <-"expression((   ))"
         tclvalue(diff)    <-"expression((   ))"
         tclvalue(Output)  <-"FALSE"
         tclvalue(Methods) <-"Euler"
         }
tkentry       <- ttkentry
x.entry       <- tkentry(tt, textvariable=x,width = 25)
t.entry       <- tkentry(tt, textvariable=t,width = 25)
t0.entry      <- tkentry(tt, textvariable=t0,width = 25)
x0.entry      <- tkentry(tt, textvariable=x0,width = 25)
drift.entry   <- tkentry(tt, textvariable=drift,width = 25)
diff.entry    <- tkentry(tt, textvariable=diff,width = 25)
Output.entry  <- tkentry(tt, textvariable=Output)
Methods.entry <- tkentry(tt, textvariable=Methods)
USTHB <- function(...)
        {
         if (is.null(t0)) return()  
         t0     <- as.numeric(tclObj(t0))
         x0     <- as.numeric(tclObj(x0))
         x      <- tclvalue(x) 
         t      <- tclvalue(t)
         drift  <- tclvalue(drift)      
         diff   <- tclvalue(diff) 
         e1     <- try(parse(text=drift))
         e2     <- try(parse(text=diff))
         e3     <- try(parse(text=x))
         e4     <- try(parse(text=t))
         Output <- as.character(tclObj(Output))
         Methods<- as.character(tclObj(Methods))
        eval(substitute(Appdcon(x=eval(e3), t=eval(e4), x0=x0, t0=t0,drift=eval(e1),diff=eval(e2),Output=Output,Methods=Methods)))
}

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x=seq(0,2,by=0.01).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Vector of quantiles : "), x.entry, sticky="w")
tkgrid(DimHlp.but, row=2, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t=seq(0,5,by=0.1) OR t = 2 .",icon="info",type="ok"))
tkgrid(tklabel(tt,text="calcul at time t : "), t.entry, sticky="w")
tkgrid(DimHlp.but, row=3, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example t0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial time (t0) : "), t0.entry,sticky="w")
tkgrid(DimHlp.but, row=4, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="Example x0 = 0.",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Initial value (x0) : "), x0.entry, sticky="w")
tkgrid(DimHlp.but, row=5, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.03 * t * x - x^3))).",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Drift coefficien : "), drift.entry,sticky="w")
tkgrid(DimHlp.but, row=6, column=2,sticky="w")

DimHlp.but <- tkbutton(tt, text="?", command=function() tkmessageBox(title="Help",message="an expression of two variables t and x, Example (expression((0.1))). ",icon="info",type="ok"))
tkgrid(tklabel(tt,text="Diffusion coefficient : "), diff.entry,sticky="w")
tkgrid(DimHlp.but, row=7, column=2,sticky="w")

frame1 <- tkframe(tt, relief = "ridge", borderwidth = 15)
tkgrid(tklabel(frame1, text = "Methods"), sticky = "n")
tkgrid(tkradiobutton(frame1, text = "Euler methods", value = "Euler", variable = Methods),
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Kessler methods", value = "Kessler", variable = Methods), 
        sticky = "w")
tkgrid(tkradiobutton(frame1, text = "Shoji-Ozaki methods", value = "Shoji-Ozaki", variable = Methods),
        sticky = "w")
tkgrid(frame1, rowspan = 1,row=8,columnspan=5,padx=5,pady=5)

tkgrid(tklabel(tt,text = "Output in Excel (.xlsx) : "),sticky = "w")
tkgrid(tkradiobutton(tt,text = "No",value="FALSE",variable = Output),row=9,columnspan = 2)
tkgrid(tkradiobutton(tt,text = "Yes",value="TRUE",variable = Output),row=9,column=1)
reset.but  <- tkbutton(tt, text="Reset", command=reset)
submit.but <- tkbutton(tt, text="Simulation",
                      command=function(){USTHB()})
q.but <- tkbutton(tt,text="Quit",
                      command=function() tkdestroy(tt))
tkgrid(submit.but,reset.but,q.but,sticky="e")
})
}


.sde.sim3D <-
function()
       {
N = 2500
t0= 0
x0 = y0 = z0 = 0
Dt = 0.001
driftx <- expression(cos(t*x*y))
drifty <- expression(cos(t))
driftz <- expression(cos(t*x))
diffx <- expression(0.1)
diffy <- expression(0.1)
diffz <- expression(0.1)

Ax    <- function(t,x,y,z)  eval(driftx)
Ay    <- function(t,x,y,z)  eval(drifty)
Az    <- function(t,x,y,z)  eval(driftz)
Sx    <- function(t,x,y,z)  eval(diffx)
Sy    <- function(t,x,y,z)  eval(diffy)
Sz    <- function(t,x,y,z)  eval(diffz)

if(missing(Dt)){t <- seq (t0 ,T, length =N+1)} 
          else {t <- c(t0 ,t0+ cumsum(rep(Dt,N)))
                T <- t[N +1]}
Dt = (T-t0)/N
wx = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dx    <- diff(wx)
wy = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dy    <- diff(wy)
wz = c(0,cumsum(rnorm(N,mean=0,sd=sqrt(Dt))))
Dz    <- diff(wz)
X    <- numeric()
Y    <- numeric()
Z    <- numeric()
X[1] <- x0
Y[1] <- y0
Z[1] <- z0
for (i in 2:(N+1)){
    X[i] = X[i-1] + Ax(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sx(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dx[i-1]
    Y[i] = Y[i-1] + Ay(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sy(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dy[i-1] 
	Z[i] = Z[i-1] + Az(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dt + Sz(t[i-1],X[i-1],Y[i-1],Z[i-1])*Dz[i-1] 
                  } 
G <- data.frame(X,Y,Z)
open3d()
a <- c(0,1,0,0)
b <- c(0,0,1,0)
c <- c(0,0,0,1)
labels <- c("O", "X", "Y", "Z")
i <- c(1,2,1,3,1,4)
segments3d(a[i],b[i],c[i],color = c("black"),lwd= 2.0,box=T)
text3d(a,b,c,labels,adj=0.5,col="red",cex=1.2,family=c("serif"))
text3d(x0,y0,z0,c("(X0,Y0,Z0)"),adj=c(0.5,-0.25),cex=0.8,family=c("serif"),col="blue")
points3d(G[1,],color = c("blue"),size=6)
for (i in 1:N) {lines3d(c(G[i,1],G[i+1,1]),c(G[i,2],G[i+1,2]),c(G[i,3],G[i+1,3]),col="black",from ="lines",lwd=2)}
title3d(family=c("serif"),main="Euler scheme : Simulation SDE Three-Dimensional",color = c("black"),cex=1.2)
title3d(family=c("serif"),font=4,sub='USTHB,Faculty of Mathematics,Department of Probabilities and Statistics,Algeria Thu Sep 29 07:20:36 2011',color = c("blue"),cex=0.8)
}


################
################
################

.treeSim.DiffProcGUI <- function()
      {
if (.Platform$OS.type != "windows") 
        return(NULL)

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
tclRequire("BWidget")
tt <- tktoplevel()
tkwm.title(tt,"Sim.DiffProcGUI version 2.2~~Tue Feb 14 22:03:59 2012")
tkwm.resizable(tt, 0,0)
xScr       <- tkscrollbar(tt,command=function(...)tkxview(treeWidget,...),orient="horizontal")
yScr       <- tkscrollbar(tt,command=function(...)tkyview(treeWidget,...))
treeWidget <- tkwidget(tt,"Tree",xscrollcommand=function(...)tkset(xScr,...),
                                 yscrollcommand=function(...)tkset(yScr,...),width=40,height=25)
tkgrid(treeWidget,yScr)
tkgrid.configure(yScr,stick="nsw")
tkgrid(xScr)
tkgrid.configure(xScr,stick="new")
tkinsert(treeWidget,"end","root","Record1Node",text="File")
tkinsert(treeWidget,"end","root","Record2Node",text="Edit")
tkinsert(treeWidget,"end","root","Record3Node",text="Brownian Motion")
tkinsert(treeWidget,"end","root","Record4Node",text="Stochastic Integral")
tkinsert(treeWidget,"end","root","Record5Node",text="Stochastic Models")
tkinsert(treeWidget,"end","root","Record6Node",text="Parametric Estimation")
tkinsert(treeWidget,"end","root","Record7Node",text="Numerical Solution of SDE")
tkinsert(treeWidget,"end","root","Record8Node",text="Statistical Analysis")
tkinsert(treeWidget,"end","root","Record9Node",text="?")
tkinsert(treeWidget,"end","Record1Node","Name1Node",text="Open file")
tkinsert(treeWidget,"end","Record1Node","Name2Node",text="Change working directory")
tkinsert(treeWidget,"end","Record1Node","Name3Node",text="Import data from...")
tkinsert(treeWidget,"end","Record1Node","Name4Node",text="Save")
tkinsert(treeWidget,"end","Record1Node","Name5Node",text="Save graphic")
tkinsert(treeWidget,"end","Record1Node","Name1212Node",text="Print...")
tkinsert(treeWidget,"end","Record1Node","Name6Node",text="Quit")
tkinsert(treeWidget,"end","Record2Node","Name7Node",text="Eval code")
tkinsert(treeWidget,"end","Record2Node","Name8Node",text="Clear")
tkinsert(treeWidget,"end","Record2Node","Name9Node",text="Undo")
tkinsert(treeWidget,"end","Record2Node","Name10Node",text="Redo")
tkinsert(treeWidget,"end","Record2Node","Name11Node",text="Cut")
tkinsert(treeWidget,"end","Record2Node","Name12Node",text="Copy")
tkinsert(treeWidget,"end","Record2Node","Name13Node",text="Paste")
tkinsert(treeWidget,"end","Record2Node","Name14Node",text="Select All")
tkinsert(treeWidget,"end","Record2Node","Name15Node",text="Delete")
tkinsert(treeWidget,"end","Record3Node","Name16Node",text="Creating Brownian Motion")
tkinsert(treeWidget,"end","Record3Node","Name17Node",text="Creating flow for Brownian Motion")
tkinsert(treeWidget,"end","Record3Node","Name18Node",text="Creating Arithmetic Brownian Motion")
tkinsert(treeWidget,"end","Record3Node","Name19Node",text="Creating Geometric Brownian Motion")
tkinsert(treeWidget,"end","Record3Node","Name20Node",text="Creating Brownian Bridge")
tkinsert(treeWidget,"end","Record3Node","Name21Node",text="Brownian Motion Property")
tkinsert(treeWidget,"end","Record3Node","Name22Node",text="Brownian Trajectory in 2D")
tkinsert(treeWidget,"end","Record3Node","Name23Node",text="Brownian Trajectory in 3D")
tkinsert(treeWidget,"end","Record4Node","Name24Node",text="Stratonovitch Integral")
tkinsert(treeWidget,"end","Record4Node","Name25Node",text="Ito Integral")
tkinsert(treeWidget,"end","Record4Node","Name26Node",text="Ito Integral vs Stratonovitch Integral")
tkinsert(treeWidget,"end","Record5Node","Name27Node",text="Attractive Model")
tkinsert(treeWidget,"end","Record5Node","Name28Node",text="Bessel Process")
tkinsert(treeWidget,"end","Record5Node","Name29Node",text="Constant Elasticity of Variance (CEV) Model")
tkinsert(treeWidget,"end","Record5Node","Name30Node",text="Cox-Ingersoll-Ross (CIR) Model")
tkinsert(treeWidget,"end","Record5Node","Name31Node",text="Chan-Karolyi-Longstaff-Sanders (CKLS) Model")
tkinsert(treeWidget,"end","Record5Node","Name32Node",text="Diffusion Bridge Model")
tkinsert(treeWidget,"end","Record5Node","Name33Node",text="Double-Well Potential Model")
tkinsert(treeWidget,"end","Record5Node","Name34Node",text="Exponential Martingales Process")
tkinsert(treeWidget,"end","Record5Node","Name35Node",text="Gaussian Diffusion Model")
tkinsert(treeWidget,"end","Record5Node","Name36Node",text="Hyperbolic Process")
tkinsert(treeWidget,"end","Record5Node","Name37Node",text="Inverse of Feller Square Root Model")
tkinsert(treeWidget,"end","Record5Node","Name38Node",text="Jacobi Diffusion Process")
tkinsert(treeWidget,"end","Record5Node","Name39Node",text="Pearson Diffusions Process")
tkinsert(treeWidget,"end","Record5Node","Name40Node",text="Stochastic Process")
tkinsert(treeWidget,"end","Record6Node","Name41Node",text="Parametric Estimation of Arithmetic Brownian Motion")
tkinsert(treeWidget,"end","Record6Node","Name42Node",text="Parametric Estimation of Model Black-Scholes")
tkinsert(treeWidget,"end","Record6Node","Name43Node",text="Parametric Estimation of Hull-White/Vasicek Model")
tkinsert(treeWidget,"end","Record6Node","Name44Node",text="Parametric Estimation of Ornstein-Uhlenbeck Model")
tkinsert(treeWidget,"end","Record7Node","Name45Node",text="One-Dimensional SDE")
tkinsert(treeWidget,"end","Record7Node","Name46Node",text="Two-Dimensional SDE")
tkinsert(treeWidget,"end","Record7Node","Name466Node",text="Three-Dimensional SDE")
tkinsert(treeWidget,"end","Record8Node","Name47Node",text="Simulation M-Samples of Random Variable")
tkinsert(treeWidget,"end","Record8Node","Name48Node",text="Simulation The First Passage Time FPT")
tkinsert(treeWidget,"end","Record8Node","Name470Node",text="Approximated Conditional Density")
tkinsert(treeWidget,"end","Record8Node","Name49Node",text="Ploting")
tkinsert(treeWidget,"end","Record8Node","Name50Node",text="Adjustment of Distributions")
tkinsert(treeWidget,"end","Record8Node","Name51Node",text="Density Estimation")
tkinsert(treeWidget,"end","Record8Node","Name52Node",text="Distribution Estimation")
tkinsert(treeWidget,"end","Record9Node","Name53Node",text="Demos")
tkinsert(treeWidget,"end","Record9Node","Name533Node",text="Teachware")
tkinsert(treeWidget,"end","Record9Node","Name54Node",text="Start Sim.DiffProc help (.HTML)")
tkinsert(treeWidget,"end","Record9Node","Name55Node",text="Start Sim.DiffProc help (.PDF)")
tkinsert(treeWidget,"end","Record9Node","Name98765Node",text="Solution of SDE(.PDF)")
tkinsert(treeWidget,"end","Record9Node","Name56Node",text="Start R help system")
tkinsert(treeWidget,"end","Record9Node","Name54326Node",text="Check for Update...")
tkinsert(treeWidget,"end","Record9Node","Name57Node",text="About Sim.DiffProc")
tkinsert(treeWidget,"end","Name6Node","Name1Val",text="Quit Sim.DiffProcGUI")
tkinsert(treeWidget,"end","Name6Node","Name2Val",text="Quit R")
tkinsert(treeWidget,"end","Name16Node","Name3Val",text="By the normal distribution")
tkinsert(treeWidget,"end","Name16Node","Name4Val",text="By a random walk")
tkinsert(treeWidget,"end","Name17Node","Name5Val",text="By the normal distribution")
tkinsert(treeWidget,"end","Name17Node","Name6Val",text="By a random walk")
tkinsert(treeWidget,"end","Name18Node","Name7Val",text="Arithmetic brownian")
tkinsert(treeWidget,"end","Name18Node","Name8Val",text="Flow of arithmetic brownian")
tkinsert(treeWidget,"end","Name19Node","Name9Val",text="Geometric brownian")
tkinsert(treeWidget,"end","Name19Node","Name10Val",text="Flow of geometric brownian")
tkinsert(treeWidget,"end","Name20Node","Name11Val",text="Brownian bridge")
tkinsert(treeWidget,"end","Name20Node","Name12Val",text="Flow of brownian bridge")
tkinsert(treeWidget,"end","Name21Node","Name13Val",text="Empirical covariance for brownian motion")
tkinsert(treeWidget,"end","Name21Node","Name14Val",text="Limite for brownian motion")
tkinsert(treeWidget,"end","Name21Node","Name15Val",text="Invariance by reversal of time")
tkinsert(treeWidget,"end","Name21Node","Name16Val",text="Invariance by scaling")
tkinsert(treeWidget,"end","Name21Node","Name17Val",text="Brownian trajectory between two functions")
tkinsert(treeWidget,"end","Name22Node","Name79Val",text="By the normal distribution")
tkinsert(treeWidget,"end","Name22Node","Name80Val",text="By a random walk")
tkinsert(treeWidget,"end","Name23Node","Name81Val",text="By the normal distribution")
tkinsert(treeWidget,"end","Name23Node","Name82Val",text="By a random walk")
tkinsert(treeWidget,"end","Name24Node","Name18Val",text="Integral(W(s) o dW(s),0,t)")
tkinsert(treeWidget,"end","Name24Node","Name19Val",text="Integral(alpha o dW(s),0,t)")
tkinsert(treeWidget,"end","Name24Node","Name20Val",text="Integral(W(s)^n o dW(s),0,t)")
tkinsert(treeWidget,"end","Name24Node","Name21Val",text="Integral(s o dW(s),0,t)")
tkinsert(treeWidget,"end","Name25Node","Name22Val",text="Integral(W(s)dW(s),0,t)")
tkinsert(treeWidget,"end","Name25Node","Name23Val",text="Integral(alpha*dW(s),0,t)")
tkinsert(treeWidget,"end","Name25Node","Name24Val",text="Integral(W(s)^n*dW(s),0,t)")
tkinsert(treeWidget,"end","Name25Node","Name25Val",text="Integral(s*dW(s),0,t)")
tkinsert(treeWidget,"end","Name26Node","Name26Val",text="Integral(W(s)dW(s),0,t) vs Integral(W(s) o dW(s),0,t)")
tkinsert(treeWidget,"end","Name26Node","Name27Val",text="Integral(s*dW(s),0,t) vs Integral(s o dW(s),0,t)")
tkinsert(treeWidget,"end","Name26Node","Name28Val",text="Integral(W(s)^n*dW(s),0,t) vs Integral(W(s)^n o dW(s),0,t)")
tkinsert(treeWidget,"end","Name27Node","Name29Val",text="Attractive Model for One-System SDE")
tkinsert(treeWidget,"end","Name27Node","Name30Val",text="Attractive Model for Two-System SDE")
tkinsert(treeWidget,"end","Name30Node","Name31Val",text="CIR Model")
tkinsert(treeWidget,"end","Name30Node","Name32Val",text="The Modified CIR and hyperbolic Process")
tkinsert(treeWidget,"end","Name35Node","Name33Val",text="Hull-White/Vasicek (HWV)")
tkinsert(treeWidget,"end","Name35Node","Name34Val",text="Ornstein-Uhlenbeck Process")
tkinsert(treeWidget,"end","Name36Node","Name35Val",text="Hyperbolic Process")
tkinsert(treeWidget,"end","Name36Node","Name36Val",text="General Hyperbolic Diffusion")
tkinsert(treeWidget,"end","Name40Node","Name37Val",text="Stochastic Process The Gamma Distribution")
tkinsert(treeWidget,"end","Name40Node","Name38Val",text="Stochastic Process The Student Distribution")
tkinsert(treeWidget,"end","Name40Node","Name39Val",text="Random Walk")
tkinsert(treeWidget,"end","Name40Node","Name40Val",text="White Noise Gaussian")
tkinsert(treeWidget,"end","Name44Node","Name41Val",text="Exact likelihood Inference")
tkinsert(treeWidget,"end","Name44Node","Name42Val",text="Explicit Estimators")
tkinsert(treeWidget,"end","Name45Node","Name43Val",text="Euler Scheme")
tkinsert(treeWidget,"end","Name45Node","Name44Val",text="Predictor-Corrector Method")
tkinsert(treeWidget,"end","Name45Node","Name45Val",text="Milstein Scheme")
tkinsert(treeWidget,"end","Name45Node","Name46Val",text="Strong Ito-Taylor Scheme")
tkinsert(treeWidget,"end","Name45Node","Name47Val",text="Heun Scheme")
tkinsert(treeWidget,"end","Name45Node","Name48Val",text="Runge-Kutta Scheme")
tkinsert(treeWidget,"end","Name46Node","Name49Val",text="Euler Scheme")
tkinsert(treeWidget,"end","Name46Node","Name50Val",text="Predictor-Corrector Method")
tkinsert(treeWidget,"end","Name46Node","Name51Val",text="Milstein Scheme")
tkinsert(treeWidget,"end","Name46Node","Name52Val",text="Strong Ito-Taylor Scheme")
tkinsert(treeWidget,"end","Name46Node","Name53Val",text="Heun Scheme")
tkinsert(treeWidget,"end","Name46Node","Name54Val",text="Runge-Kutta Scheme")
tkinsert(treeWidget,"end","Name466Node","Name499Val",text="Euler Scheme")
tkinsert(treeWidget,"end","Name466Node","Name500Val",text="Predictor-Corrector Method")
tkinsert(treeWidget,"end","Name466Node","Name511Val",text="Milstein Scheme")
tkinsert(treeWidget,"end","Name466Node","Name522Val",text="Strong Ito-Taylor Scheme")
tkinsert(treeWidget,"end","Name466Node","Name533Val",text="Heun Scheme")
tkinsert(treeWidget,"end","Name466Node","Name544Val",text="Runge-Kutta Scheme")
tkinsert(treeWidget,"end","Name49Node","Name55Val",text="Histograms")
tkinsert(treeWidget,"end","Name49Node","Name56Val",text="Kernel Density")
tkinsert(treeWidget,"end","Name49Node","Name57Val",text="Empirical Distribution")
tkinsert(treeWidget,"end","Name50Node","Name58Val",text="Beta Distribution")
tkinsert(treeWidget,"end","Name50Node","Name59Val",text="Chi-Squared Distribution")
tkinsert(treeWidget,"end","Name50Node","Name60Val",text="Exponential Distribution")
tkinsert(treeWidget,"end","Name50Node","Name61Val",text="Fisher Distribution")
tkinsert(treeWidget,"end","Name50Node","Name62Val",text="Gamma Distribution")
tkinsert(treeWidget,"end","Name50Node","Name63Val",text="Log Normal Distribution")
tkinsert(treeWidget,"end","Name50Node","Name64Val",text="Normal Distribution")
tkinsert(treeWidget,"end","Name50Node","Name65Val",text="Student Distribution")
tkinsert(treeWidget,"end","Name50Node","Name66Val",text="Weibull Distribution")
tkinsert(treeWidget,"end","Name51Node","Name67Val",text="by Histograms Methods")
tkinsert(treeWidget,"end","Name51Node","Name68Val",text="by Kernel Methods")
tkinsert(treeWidget,"end","Name53Node","Name698Val",text="Conditional Density for Langevin Equation")
tkinsert(treeWidget,"end","Name53Node","Name69Val",text="Attractive Model for One-System SDE (2D)")
tkinsert(treeWidget,"end","Name53Node","Name70Val",text="Attractive Model for One-System SDE (3D)")
tkinsert(treeWidget,"end","Name53Node","Name71Val",text="Attractive Model for Two-System SDE (2D)")
tkinsert(treeWidget,"end","Name53Node","Name72Val",text="Attractive Model for Two-System SDE (3D)")
tkinsert(treeWidget,"end","Name53Node","Name73Val",text="Brownian Motion in 2D plane")
##tkinsert(treeWidget,"end","Name53Node","Name74Val",text="Brownian Motion Trajectory Approxsime by Euler Scheme")
tkinsert(treeWidget,"end","Name53Node","Name75Val",text="Flow of the Diffusion Processes")
tkinsert(treeWidget,"end","Name53Node","Name76Val",text="Numerical Simulation")
tkinsert(treeWidget,"end","Name53Node","Name78Val",text="Stochastic Processes (Models)")
tkinsert(treeWidget,"end","Name30Val","Age1Val",text="Two-Dimensional Attractive Model")
tkinsert(treeWidget,"end","Name30Val","Age2Val",text="Three-Dimensional Attractive Model")
tkinsert(treeWidget,"end","Name30Val","Age3Val",text="Simulation The First Passage Time")
tkinsert(treeWidget,"end","Name33Val","Age4Val",text="Hull-White/Vasicek Model")
tkinsert(treeWidget,"end","Name33Val","Age5Val",text="Flow of Hull-White/Vasicek Model")
tkinsert(treeWidget,"end","Name34Val","Age6Val",text="Ornstein-Uhlenbeck Process")
tkinsert(treeWidget,"end","Name34Val","Age7Val",text="Flow of Ornstein-Uhlenbeck Process")
tkinsert(treeWidget,"end","Name34Val","Age8Val",text="Radial Ornstein-Uhlenbeck Process")
tkinsert(treeWidget,"end","Name45Val","Age9Val",text="Milstein Scheme")
tkinsert(treeWidget,"end","Name45Val","Age10Val",text="Milstein Second Scheme")
tkinsert(treeWidget,"end","Name51Val","Age11Val",text="Milstein Scheme")
tkinsert(treeWidget,"end","Name51Val","Age12Val",text="Milstein Second Scheme")
tkinsert(treeWidget,"end","Name511Val","Age111Val",text="Milstein Scheme")
tkinsert(treeWidget,"end","Name511Val","Age122Val",text="Milstein Second Scheme")
tkinsert(treeWidget,"end","Name58Val","Age15Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name58Val","Age16Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name59Val","Age17Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name59Val","Age18Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name60Val","Age19Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name60Val","Age20Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name61Val","Age21Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name61Val","Age22Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name62Val","Age23Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name62Val","Age24Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name63Val","Age25Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name63Val","Age26Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name64Val","Age27Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name64Val","Age28Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name65Val","Age29Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name65Val","Age30Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name66Val","Age31Val",text="Estimate of The Parameters")
tkinsert(treeWidget,"end","Name66Val","Age32Val",text="Kolmogorov-Smirnov Tests")
tkinsert(treeWidget,"end","Name76Val","Age765Val",text="One-Dimensional SDE")
tkinsert(treeWidget,"end","Name76Val","Age766Val",text="Two-Dimensional SDE")
tkinsert(treeWidget,"end","Name76Val","Age767Val",text="Three-Dimensional SDE")
})
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

###############################################################################
############################### Menu ##########################################

tt <- tktoplevel()
topMenu <- tkmenu(tt)
tkwm.title(tt,"Sim.DiffProc~~Simulation of Diffusion Processes(V.2.2-Tue Feb 14 22:03:59 2012)")
tkwm.resizable(tt,0,0)
##tkwm.maxsize(tt,912,412)
tkwm.positionfrom(tt)
tkwm.sizefrom(tt)
Rico <- tk2ico.load(file.path(R.home("bin"),"R.exe"), res = "R")
tk2ico.set(tt, Rico)
tk2ico.destroy(Rico)
rm(Rico)
tkwm.deiconify(tt)
tkconfigure(tt,menu=topMenu)
tkfocus(tt)
frame000 <- tkframe(tt, relief = "groove", borderwidth = 3)
icnfnameR <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"img"),
             "/", "usthb.GIF", sep="")
icn <- tkimage.create("photo", file=icnfnameR)
Rlabel <- tklabel(tt, image=icn)
tkgrid(tkbutton(frame000, image=icn), padx=0.5,pady=0.5, sticky = "ne",columnspan=2,row=0)
tkgrid(frame000,row=0, column=1,sticky = "e",padx=5,pady=5)
xscr <- ttkscrollbar(tt, orient="horizontal",
                     command=function(...) tkxview(txt, ...))
yscr <- ttkscrollbar(tt,
                     command=function(...) tkyview(txt, ...))
txt <- tktext(tt,width=98,height=14, bg="white",wrap="none", undo=TRUE,yscrollcommand = function(...) tkset(xscr, 
        ...))
tkconfigure(txt, xscrollcommand=function(...) tkset(xscr, ...))
tkconfigure(txt, yscrollcommand=function(...) tkset(yscr, ...))

# xscr2 <- ttkscrollbar(tt, orient="horizontal",
                     # command=function(...) tkxview(txt2, ...))
# yscr2 <- ttkscrollbar(tt,
                     # command=function(...) tkyview(txt2, ...))
# txt2 <- tktext(tt,width=98,height=13, bg="white",wrap="none", undo=TRUE,yscrollcommand = function(...) tkset(xscr2, 
        # ...))
# tkconfigure(txt2, xscrollcommand=function(...) tkset(xscr2, ...))
# tkconfigure(txt2, yscrollcommand=function(...) tkset(yscr2, ...))

# xscr3 <- ttkscrollbar(tt, orient="horizontal",
                     # command=function(...) tkxview(txt3, ...))
# yscr3 <- ttkscrollbar(tt,
                     # command=function(...) tkyview(txt3, ...))
# txt3 <- tktext(tt,width=98,height=2, bg="gray85",wrap="none", undo=TRUE,yscrollcommand = function(...) tkset(xscr3, 
        # ...))
# tkconfigure(txt3, xscrollcommand=function(...) tkset(xscr3, ...))
# tkconfigure(txt3, yscrollcommand=function(...) tkset(yscr3, ...))


###############################################################################
###############################################################################

frame0 <- tkframe(tt, relief = "groove", borderwidth = 5)
icnfname1 <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"icon"),
             "/", "Open.GIF", sep="")
icnfname2 <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"icon"),
             "/", "chagsave.GIF", sep="")
icnfname3 <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"icon"),
             "/", "save.GIF", sep="")
icnfname4 <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"icon"),
             "/", "Help.GIF", sep="")
icnfname5 <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"icon"),
             "/", "home.GIF", sep="")
icnfname6 <- paste(file.path(.path.package(package="Sim.DiffProc")[1],"icon"),
             "/", "about.GIF", sep="")
icn1 <- tkimage.create("photo", file=icnfname1)
icn2 <- tkimage.create("photo", file=icnfname2)
icn3 <- tkimage.create("photo", file=icnfname3)
icn4 <- tkimage.create("photo", file=icnfname4)
icn5 <- tkimage.create("photo", file=icnfname5)
icn6 <- tkimage.create("photo", file=icnfname6)
tkgrid(tkbutton(frame0, image=icn1,command=function(){.openFile()}), padx=0.5,pady=0.5, sticky = "nw",row=0)
tkgrid(tkbutton(frame0, image=icn2,command=function(){.setWd()}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=1)
tkgrid(tkbutton(frame0, image=icn3,command=function(){Save()}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=2)
tkgrid(tkbutton(frame0, image=icn4,command=function(){print(help("Sim.DiffProc"))}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=4)
tkgrid(tkbutton(frame0, image=icn5,command=function(){browseURL("http://www.r-project.org")}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=5)
tkgrid(tkbutton(frame0, image=icn6,command=function(){.treeSim.DiffProcGUI()}), padx=0.5,pady=0.5, sticky = "nw",row=0,column=3)
tkgrid(frame0,row=0, sticky = "nw",padx=5,pady=5)

frame <- tkframe(tt, relief = "groove", borderwidth = 5)
tkgrid(tkbutton(frame,text="Plot Your Data",command=function(){.YourPlotGUI()},width=17),column=1,row=0)
tkgrid(tkbutton(frame,text="Add Your Data",command=function(){.YourPointsGUI()},width=17),column=1,row=1)
tkgrid(tkbutton(frame,text="Plot Your Solution",command=function(){.YourSolutionGUI()},width=17),column=2,row=0)
tkgrid(tkbutton(frame,text="Add Your Solution",command=function(){.AddSolutionGUI()},width=17),column=2,row=1)
tkgrid(tkbutton(frame,text="Show Data",command=function(){.choosdata()},width=17),column=3,row=0)
tkgrid(tkbutton(frame,text="Save Graphic",command=function(){.outgraph()},width=17),column=3,row=1)
tkgrid(frame,row=0, sticky = "w",column=1,padx=5,pady=5)



tkgrid(tklabel(tt, text=gettext("R-Sim.DiffProc Console"), foreground="blue"),row=1,sticky="w")
tkgrid(txt, yscr, sticky="news", columnspan=2,row=2)
tkgrid(xscr,columnspan=2)
tkgrid.configure(yscr, sticky="ns")
tkgrid.configure(xscr, sticky="ew")
tkfocus(txt)

# tkgrid(tklabel(tt, text=gettext("R-Output"), foreground="blue"),row=10,sticky="w")
# tkgrid(txt2, yscr2, sticky="news", columnspan=2,row=11)
# tkgrid(xscr2,columnspan=2)
# tkgrid.configure(yscr2, sticky="ns")
# tkgrid.configure(xscr2, sticky="ew")
# tkfocus(txt2)


# tkgrid(tklabel(tt, text=gettext("R-Sim.DiffProc Warning"), foreground="blue"),row=13,sticky="w")
# tkgrid(txt3, yscr3, sticky="news", columnspan=2,row=14)
# tkgrid(xscr3,columnspan=2)
# tkgrid.configure(yscr3, sticky="ns")
# tkgrid.configure(xscr3, sticky="ew")
# tkfocus(txt3)
###############################################################################
###############################################################################

###############################################################################
############################### functions #####################################

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

exit <-function(){
    exitValue <- tkmessageBox(message="Are you sure you want to exit Sim.DiffProc ?",
      icon="question",
      type="okcancel",
      default="cancel",
      parent= tt)
    if(tclvalue(exitValue) == "ok"){
      tkdestroy(tt) || closeAllConnections()
   }
  }

# R.base.dir <- system.file()
# lib.loc <- .libPaths()[1L]
# Met.Console <- paste(lib.loc, "/Sim.DiffProc/Console/SDP_Console_O", 
        # sep = "")
# Met.Console2 <- paste(lib.loc, "/Sim.DiffProc/Console/SDP_Console_W", 
        # sep = "")
# z  <- file(Met.Console, "w+b")
# z2 <- file(Met.Console2, "w+b")
# sink(file = z, append = TRUE, type = c("output", "message"), 
        # split = FALSE)
# sink(file = z2, append = TRUE, type = "message", split = FALSE)
# .write <- function() {
        # tkconfigure(txt2, state = "normal")
        # tkconfigure(txt3, state = "normal")
        # chn <- tclopen(Met.Console, "r")
        # chn2 <- tclopen(Met.Console2, "r")
        # tkdelete(txt2, "0.0", "100000.0")
        # tkdelete(txt3, "0.0", "100000.0")
        # tkinsert(txt2, "end", tclvalue(tclread(chn)))
        # tkinsert(txt3, "end", tclvalue(tclread(chn2)))
        # tkconfigure(txt2, state = "disabled",foreground="blue")
        # tkconfigure(txt3, state = "disabled",foreground="red")
        # }
# evalGUI <- function() {
    # code <- tclvalue(tkget(txt, "0.0", "end"))
    # e <- try(parse(text = code))
    # if (inherits(e, "try-error")) {
          # tkmessageBox(message = "Syntax error", icon = "error")
           # return()
        # }
    # .write()
    # print(eval(e))
    # .write()
#    }

evalGUI <-function() 
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

Save <-function() 
        {
  text <- tclvalue(tkget(get("txt"), "@0,0", "end"))
  fname <- tclvalue(tkgetSaveFile(filetypes = "{{Text Files} {.txt}} {{All files} *}"))
  if (fname != "") {
  f <- file(fname)
  writeLines(text, con = f)
  close(f)
            }
        }


.openFile <- function()
          {
logFile <- tclvalue(tkgetOpenFile(filetypes=gettext('{"Script Files" {".R"}} {"All Files" {"*"}}'),
        defaultextension="log"))
if (logFile == "") return()
fileCon <- file(logFile, "r")
contents <- readLines(fileCon)
close(fileCon)
tkdelete(txt, "1.0", "end")
tkinsert(txt, "end", paste(contents, collapse="\n"))
}

.setWd <- function()
      {
    wd <- tclvalue(tkchooseDirectory(initialdir = getwd()))
    if (wd != ""){
      setwd (wd)
    }
  }

Pritxt <- function() NULL
.Print.file <- function() {
      try(win.print(), silent = TRUE)
      if (geterrmessage() != "Error in win.print() : unable to start device devWindows\n") {
      Pritxt()
      dev.off()
        }
    }

SDP.update <- function()
{
  version.available <- available.packages(contriburl="http://cran.at.r-project.org/bin/windows/contrib/2.14")["Sim.DiffProcGUI","Version"]
  version.installed <- installed.packages()["Sim.DiffProcGUI","Version"]
  if(compareVersion(version.available,version.installed)==1){
  tkmessageBox(title="Update Sim.DiffProcGUI...",message=paste("A new version of Sim.DiffProcGUI is available and is being installed, close and restart Sim.DiffProcGUI."))
  detach(package:Sim.DiffProc)
  detach(package:Sim.DiffProcGUI)
  install.packages("Sim.DiffProcGUI",contriburl="http://CRAN.R-project.org/package=Sim.DiffProcGUI")    
  }else{
  tkmessageBox(title="Update Sim.DiffProcGUI...",message=paste("You have the most recent version of Sim.DiffProcGUI.")) 
  }
}


###############################################################################
################################### File ######################################
  
fileMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="File",menu=fileMenu,underline = "1")
tkadd(fileMenu,"command",label="Open file",command=function() {.openFile()})
tkadd(fileMenu,"command",label="Change working directory",command=function(){.setWd()})
tkadd(fileMenu,"separator")
tkadd(fileMenu,"command",label="Import data from...",command=function(){.importDataGUI()})
tkadd(fileMenu,"command",label="Save",accelerator="Ctrl+S",command=function(){Save()})
tkadd(fileMenu,"command",label="Save graphic",accelerator="Ctrl+G",command=function() {.outgraph()})
##tkadd(fileMenu,"command",label="Print...",accelerator="Ctrl+P",command=function() {.Print.file()})
tkadd(fileMenu, "command", label = "Print...", 
        accelerator = "Ctrl+P", state = if (.Platform$OS.type != 
            "windows") 
            "disabled"
        else "normal", command = function() {
            .Print.file()
        })

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

EDMenu <- tkmenu(tkmenu(txt),tearoff=FALSE)
tkadd(topMenu,"cascade",label="Edit",menu=EDMenu,underline = "0")
tkadd(EDMenu,"command",label="Eval Code",
     accelerator="Ctrl+R",command=function() {evalGUI()})
tkadd(EDMenu,"command",label="Clear",
     accelerator="Ctrl+T",command=function(){tkdelete(txt, '@0,0', 'end' )})
tkadd(EDMenu,"separator")
tkadd(EDMenu,"command",label="Undo",
     accelerator="Ctrl+Z",command=function() {onUndo()})
tkadd(EDMenu,"command",label="Redo",
     accelerator="Ctrl+W",command=function() {onRedo()})
tkadd(EDMenu,"separator")
tkadd(EDMenu,"command",label="Cut",
     accelerator="Ctrl+X",command=function() {onCut()})
tkadd(EDMenu,"command",label="Copy",
     accelerator="Ctrl+C",command=function() {onCopy()})
tkadd(EDMenu,"command",label="Paste",
     accelerator="Ctrl+V",command=function() {onPaste()})
tkadd(EDMenu,"separator")
tkadd(EDMenu,"command",label="Select All",
     accelerator="Ctrl+A",command=function() {onSelectAll()})
tkadd(EDMenu,"command",label="Delete",
     accelerator="Ctrl+D",command=function() {onDelete()})
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
tkbind(tt, "<Control-p>", .Print.file)
tkbind(tt, "<Control-P>", .Print.file)
tkbind(txt, "<Button-3>", click)

###############################################################################
####################### Brownian Motion Model #################################

BMMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Brownian Motion",menu=BMMMenu,underline = "0")
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

BM2DDMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BM2DDMenu,"command",label="by The Normal Distribution",
      command=function() {.BMN2DGUI()})
tkadd(BM2DDMenu,"command",label="by a Random Walk",
      command=function(){.BMRW2DGUI()} )
tkadd(BMMMenu,"cascade",label="Brownian Trajectory in 2D",menu=BM2DDMenu)

BM3DDMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BM3DDMenu,"command",label="by The Normal Distribution",
      command=function() {.BMN3DGUI()})
tkadd(BM3DDMenu,"command",label="by a Random Walk",
      command=function(){.BMRW3DGUI()} )
tkadd(BMMMenu,"cascade",label="Brownian Trajectory in 3D",menu=BM3DDMenu)
###############################################################################
#############################  Stochastic Integral ############################

STMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Stochastic Integral",menu=STMenu,underline = "0")
Stra <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Stra,"command",label="Integral(W(s) o dW(s),0,t)",
       command=function() {.BMStraGUI()})
tkadd(Stra,"command",label="Integral(alpha o dW(s),0,t)",
       command=function() {.BMStraCGUI()})
tkadd(Stra,"command",label="Integral(W(s)^n o dW(s),0,t)",
       command=function() {.BMStraPGUI()})
tkadd(Stra,"command",label="Integral(s o dW(s),0,t)",
       command=function() {.BMStraTGUI()})
tkadd(STMenu,"cascade",label="Stratonovitch Integral",menu=Stra)
Ito <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Ito,"command",label="Integral(W(s)dW(s),0,t)",
       command=function() {.BMIto2GUI()})
tkadd(Ito,"command",label="Integral(alpha*dW(s),0,t)",
       command=function() {.BMItoCGUI()})
tkadd(Ito,"command",label="Integral(W(s)^n*dW(s),0,t)",
       command=function() {.BMItoPGUI()})
tkadd(Ito,"command",label="Integral(s*dW(s),0,t)",
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

SMMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Stochastic Models",menu=SMMenu,underline = "0")

Attarctive  <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Attarctive,"command",label="Attractive Model for One-System SDE",
     command=function() {.ModAttractiveGUI()})
Attarctive2 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Attarctive2,"command",label="Two-Dimensional Attractive Model",
     command=function() {.TowDiffAtra2DGUI()})
tkadd(Attarctive2,"command",label="Three-Dimensional Attractive Model",
     command=function() {.TowDiffAtra3DGUI()})
tkadd(Attarctive2,"command",label="Simulation The First Passage Time",
     command=function() {.tho_02diffGUI()})
tkadd(Attarctive,"cascade",label="Attractive Model for Two-System SDE",menu=Attarctive2)
tkadd(SMMenu,"cascade",label="Attractive Model",menu=Attarctive)

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

Guss <- tkmenu(topMenu,tearoff=FALSE)
HWVMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(HWVMenu,"command",label="Hull-White/Vasicek Model",
     command=function() {.HWVGUI()})
tkadd(HWVMenu,"command",label="Flow of Hull-White/Vasicek Model",
     command=function() {.HWVFGUI()})
tkadd(Guss,"cascade",label="Hull-White/Vasicek (HWV)",menu=HWVMenu)

OUMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(OUMenu,"command",label="Ornstein-Uhlenbeck Process",
     command=function() {.OUGUI()})
tkadd(OUMenu,"command",label="Flow of Ornstein-Uhlenbeck Process",
     command=function() {.OUFGUI()})
tkadd(OUMenu,"command",label="Radial Ornstein-Uhlenbeck Process",
     command=function() {.ROUGUI()})
tkadd(Guss,"cascade",label="Ornstein-Uhlenbeck Process",menu=OUMenu)
tkadd(SMMenu,"cascade",label="Gaussian Diffusion Model",menu=Guss)

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

EPMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Parametric Estimation",menu=EPMenu,underline = "0")
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

SNSMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Numerical Methods",menu=SNSMenu,underline = "0")
NumSDE1 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(NumSDE1,"command",label="Euler Scheme",
     command=function() {.EulerGUI()})
tkadd(NumSDE1,"command",label="Predictor-Corrector Method",
     command=function() {.PredCorrGUI()})
MIMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(MIMenu,"command",label="Milstein Scheme",
     command=function() {.MilsteinGUI()})
tkadd(MIMenu,"command",label="Milstein Second Scheme",
     command=function() {.MilsteinSGUI()})
tkadd(NumSDE1,"cascade",label="Milstein Scheme",menu=MIMenu)
tkadd(NumSDE1,"command",label="Strong Ito-Taylor Scheme",
     command=function() {.STSGUI()})
tkadd(NumSDE1,"command",label="Heun Scheme",
     command=function() {.HeunGUI()})
tkadd(NumSDE1,"command",label="Runge-Kutta Scheme",
     command=function() {.RK3GUI()})
tkadd(SNSMenu,"cascade",label="One-Dimensional SDE",menu=NumSDE1)
NumSDE2 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(NumSDE2,"command",label="Euler Scheme",
     command=function() {.Euler2DGUI()})
tkadd(NumSDE2,"command",label="Predictor-Corrector Method",
     command=function() {.PredCorr2DGUI()})
MIMenu2 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(MIMenu2,"command",label="Milstein Scheme",
     command=function() {.Milstein2DGUI()})
tkadd(MIMenu2,"command",label="Milstein Second Scheme",
     command=function() {.MilsteinS2DGUI()})
tkadd(NumSDE2,"cascade",label="Milstein Scheme",menu=MIMenu2)
tkadd(NumSDE2,"command",label="Strong Ito-Taylor Scheme",
     command=function() {.STS2DGUI()})
tkadd(NumSDE2,"command",label="Heun Scheme",
     command=function() {.Heun2DGUI()})
tkadd(NumSDE2,"command",label="Runge-Kutta Scheme",
     command=function() {.RK32DGUI()})
tkadd(SNSMenu,"cascade",label="Two-Dimensional SDE",menu=NumSDE2)

NumSDE3 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(NumSDE3,"command",label="Euler Scheme",
     command=function() {.Euler3DGUI()})
tkadd(NumSDE3,"command",label="Predictor-Corrector Method",
     command=function() {.PredCorr3DGUI()})
MIMenu3 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(MIMenu3,"command",label="Milstein Scheme",
     command=function() {.Milstein3DGUI()})
tkadd(MIMenu3,"command",label="Milstein Second Scheme",
     command=function() {.MilsteinS3DGUI()})
tkadd(NumSDE3,"cascade",label="Milstein Scheme",menu=MIMenu3)
tkadd(NumSDE3,"command",label="Strong Ito-Taylor Scheme",
     command=function() {.STS3DGUI()})
tkadd(NumSDE3,"command",label="Heun Scheme",
     command=function() {.Heun3DGUI()})
tkadd(NumSDE3,"command",label="Runge-Kutta Scheme",
     command=function() {.RK33DGUI()})
tkadd(SNSMenu,"cascade",label="Three-Dimensional SDE",menu=NumSDE3)


###############################################################################
############################   Statistical analysis          ##################

AnayMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="Statistical Analysis",menu=AnayMenu,underline = "0")
tkadd(AnayMenu,"command",label="Simulation M-Samples of Random Variable",
      command=function() {.AnaSimXGUI()})
tkadd(AnayMenu,"command",label="Simulation The First Passage Time FPT",
      command=function() {.AnaSimFPTGUI()})
tkadd(AnayMenu,"command",label="Approximated Conditional Density",
      command=function() {.AppdconGUI()})	  
	  
PLOT <- tkmenu(topMenu,tearoff=FALSE)
tkadd(PLOT,"command",label="Histograms",
      command=function() {.hist_methGUI()})
tkadd(PLOT,"command",label="Kernel Density",
      command=function() {.Ker_meth_GUI()})
tkadd(PLOT,"command",label="Empirical Distribution",
      command=function() {.fctrep_Meth_GUI()})
tkadd(AnayMenu,"cascade",label="Ploting",menu=PLOT)

Adjus <- tkmenu(topMenu,tearoff=FALSE)
BETA <- tkmenu(topMenu,tearoff=FALSE)
tkadd(BETA,"command",label="Estimate of The Parameters",
     command=function() {.AjdbetaGUI()})
tkadd(BETA,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dbetaGUI()})
tkadd(Adjus,"cascade",label="Beta Distribution",menu=BETA)

CHISQ <- tkmenu(topMenu,tearoff=FALSE)
tkadd(CHISQ,"command",label="Estimate of The Parameters",
     command=function() {.AjdchisqGUI()})
tkadd(CHISQ,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dchisqGUI()})
tkadd(Adjus,"cascade",label="Chi-Squared Distribution",menu=CHISQ)

EXPON <- tkmenu(topMenu,tearoff=FALSE)
tkadd(EXPON,"command",label="Estimate of The Parameters",
     command=function() {.AjdexpGUI()})
tkadd(EXPON,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dexpGUI()})
tkadd(Adjus,"cascade",label="Exponential Distribution",menu=EXPON)

FISHER <- tkmenu(topMenu,tearoff=FALSE)
tkadd(FISHER,"command",label="Estimate of The Parameters",
     command=function() {.AjdfGUI()})
tkadd(FISHER,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dfGUI()})
tkadd(Adjus,"cascade",label="Fisher Distribution",menu=FISHER)

GAMMA <- tkmenu(topMenu,tearoff=FALSE)
tkadd(GAMMA,"command",label="Estimate of The Parameters",
     command=function() {.AjdgammaGUI()})
tkadd(GAMMA,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dgammaGUI()})
tkadd(Adjus,"cascade",label="Gamma Distribution",menu=GAMMA)

LOGNORMA <- tkmenu(topMenu,tearoff=FALSE)
tkadd(LOGNORMA,"command",label="Estimate of The Parameters",
     command=function() {.AjdlognormGUI()})
tkadd(LOGNORMA,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dlognormGUI()})
tkadd(Adjus,"cascade",label="Log Normal Distribution",menu=LOGNORMA)

NORMA <- tkmenu(topMenu,tearoff=FALSE)
tkadd(NORMA,"command",label="Estimate of The Parameters",
     command=function() {.AjdnormGUI()})
tkadd(NORMA,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dnormGUI()})
tkadd(Adjus,"cascade",label="Normal Distribution",menu=NORMA)

STUDENT <- tkmenu(topMenu,tearoff=FALSE)
tkadd(STUDENT,"command",label="Estimate of The Parameters",
     command=function() {.AjdtGUI()})
tkadd(STUDENT,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dtGUI()})
tkadd(Adjus,"cascade",label="Student Distribution",menu=STUDENT)

Weibull <- tkmenu(topMenu,tearoff=FALSE)
tkadd(Weibull,"command",label="Estimate of The Parameters",
     command=function() {.AjdweibullGUI()})
tkadd(Weibull,"command",label="Kolmogorov-Smirnov Tests",
     command=function() {.test_ks_dweibullGUI()})
tkadd(Adjus,"cascade",label="Weibull Distribution",menu=Weibull)
tkadd(AnayMenu,"cascade",label="Adjustment of Distributions",menu=Adjus)

AJDDE <- tkmenu(topMenu,tearoff=FALSE)
tkadd(AJDDE,"command",label="by Histograms Methods",
      command=function() {.hist_generalGUI()})
tkadd(AJDDE,"command",label="by Kernel Methods",
      command=function() {.Kern_generalGUI()})
tkadd(AnayMenu,"cascade",label="Density Estimation",menu=AJDDE)
tkadd(AnayMenu,"command",label="Distribution Estimation",
      command=function() {.fctgeneralGUI()})

###############################################################################
##############################  Aide  #########################################

AideMenu <- tkmenu(topMenu,tearoff=FALSE)
tkadd(topMenu,"cascade",label="?",menu=AideMenu)
DOMenu <- tkmenu(topMenu,tearoff=FALSE)

tkadd(DOMenu,"command",label="Conditional Density for Langevin Equation",
     command=function() {.Codion()})

tkadd(DOMenu,"command",label="Attractive Model for One-System SDE (2D)",
     command=function() {.Attra2D()})
tkadd(DOMenu,"command",label="Attractive Model for One-System SDE (3D)",
     command=function() {.Attra3D()})
tkadd(DOMenu,"command",label="Attractive Model for Two-System SDE (2D)",
     command=function() {.Attra2D2()})
tkadd(DOMenu,"command",label="Attractive Model for Two-System SDE (3D)",
     command=function() {.Attra3D2()})
tkadd(DOMenu,"command",label="Brownian Motion in 2D plane",
     command=function() {.BM2D()})
##tkadd(DOMenu,"command",label="Brownian Motion Trajectory Approxsime by Euler Scheme",
##     command=function() {.BMEuler()})
tkadd(DOMenu,"command",label="Flow of the Diffusion Processes",
     command=function() {.flow()})
		 
MIMenu332 <- tkmenu(topMenu,tearoff=FALSE)
tkadd(MIMenu332,"command",label="One-Dimensional SDE",
     command=function() {.sde.sim()})
tkadd(MIMenu332,"command",label="Two-Dimensional SDE",
     command=function() {.sde.sim2D()})
tkadd(MIMenu332,"command",label="Three-Dimensional SDE",
     command=function() {.sde.sim3D()})

tkadd(DOMenu,"cascade",label="Numerical Simulation",menu=MIMenu332)
	 
tkadd(DOMenu,"command",label="Stochastic Processes (Models)",
     command=function() {.sde()})
tkadd(AideMenu,"cascade",label="Demos",menu=DOMenu)
tkadd(AideMenu,"command",label="Teachware",
      command= function(){
                         browseURL(paste(file.path(.path.package(package="Sim.DiffProcGUI")[1], "teachware"),
             "/", "1.JPG", sep=""))})
tkadd(AideMenu,"separator")
tkadd(AideMenu,"command",label="Start Sim.DiffProc help (.HTML)",
     command= function() {print(help("Sim.DiffProc"))})
tkadd(AideMenu,"command",label="Start Sim.DiffProc help (.PDF)",
     command= function(){
                         browseURL(paste(file.path(.path.package(package="Sim.DiffProc")[1], "doc"),
             "/", "RSim.DiffProc.pdf", sep=""))})
tkadd(AideMenu,"command",label="Solution of SDE (.PDF)",
     command= function(){
                         browseURL(paste(file.path(.path.package(package="Sim.DiffProc")[1], "doc"),
             "/", "EDS.pdf", sep=""))})
tkadd(AideMenu,"command",label="Start R help system",
     command= function() {help.start()})
tkadd(AideMenu,"separator")
tkadd(AideMenu,"command",label="Check for Update...",
     command= function() {SDP.update()})
tkadd(AideMenu,"command",label="About Sim.DiffProcGUI...",underline = "0",accelerator="F1", 
     command= function() {tkmessageBox(title="Information",message=paste(" Sim.DiffProc version 2.2 (Tue Feb 14 22:03:59 2012).\n","BOUKHETALA Kamal <kboukhetala@usthb.dz>.\n", "GUIDOUM Arsalane <starsalane@gmail.com>.\n",
             "University of Sciences and Technology Houari Boumediene (USTHB)\n","Faculty of Mathematics\n","Department of Probabilities and Statistics.\n",
             "Copyright (C) 2012 USTHB, Algeria."))})
tkbind(tt, "<F1>", function() {tkmessageBox(title="Information",message=paste(" Sim.DiffProc version 2.2 (Tue Feb 14 22:03:59 2012).\n","BOUKHETALA Kamal <kboukhetala@usthb.dz>.\n", "GUIDOUM Arsalane <starsalane@gmail.com>.\n",
             "University of Sciences and Technology Houari Boumediene (USTHB)\n","Faculty of Mathematics\n","Department of Probabilities and Statistics.\n",
             "Copyright (C) 2012 USTHB, Algeria."))})

###############################################################################
##############################   Run    #######################################

## fontHeading <- tkfont.create(family="times",size=11,weight="bold")
Run.but <- tkbutton(tt,text="Eval Code",command=function(){evalGUI()},width=50)##,foreground="black", background="skyblue4", font=fontHeading)
tkgrid(Run.but,row=10,sticky="news",column=0)
Clear.but <- tkbutton(tt,text="Clear",command=function(){tkdelete(txt, '@0,0', 'end' )},width=35)##,foreground="black", background="skyblue4", font=fontHeading)
tkgrid(Clear.but,sticky="news",row=10,column=1)

###############################################################################
################################    End         ###############################

site <- function(){browseURL("http://www.usthb.dz")}
## fontHeading1 <- tkfont.create(family="times",size=10,weight="bold",slant="italic")
USTHB.but <- tkbutton(tt,text="     University of Sciences and Technology Houari Boumediene (USTHB)
Faculty of Mathematics , Department of Probabilities and Statistics , Algeria",command=function(){site()})
tkgrid(USTHB.but,sticky="news",row=18,column=0,columnspan=2)
###############################################################################
###############################################################################
})
}






