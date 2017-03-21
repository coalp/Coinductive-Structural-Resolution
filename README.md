# Co-inductive Structural Resolution
A logically sound combination of structural resolution wth co-SLD style loop detection 

This repository host [SWI-Prolog](http://www.swi-prolog.org/) source code of the implementation of co-inductive structural resolution, and the [research paper](co_s_reso.pdf) on this topic. This document helps you nevigate among the files in this repository.  Appendix A of the [research paper](co_s_reso.pdf) provides additional note for the codes.

## Source code
* The main file is [co_s_reso_minimal.pl](co_s_reso_minimal.pl), which depends on 
  * the search rule file [search_rule.pl](search_rule.pl) 
* There are three example object programs for the co-S resoution interpreter, they are
  * [example.pl](example.pl)
  * [example02.pl](example02.pl)
  * [example03.pl](example03.pl)
* In addition, we also provide minimal implementation of structural resolution and co-SLD resolution, in [s_reso_minimal](s_reso_minimal.pl) and [coSLD_minimal](coSLD_minimal.pl) respectively. 
    * More detailed information on implementation of structural resolution is in the [structural resolution repository](https://github.com/coalp/Structural-Resolution-in-Prolog). 
