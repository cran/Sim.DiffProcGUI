 .onAttach <- function(...){
    if(interactive()) Sim.DiffGUI()
    else {
		packageStartupMessage("The Sim.DiffGUI is launched only in interactive sessions",
            domain="R-Sim.DiffProcGUI")
        return()
        }
    }

