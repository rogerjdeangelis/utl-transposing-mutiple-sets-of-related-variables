Transposing mutiple sets of related variables

github
https://tinyurl.com/wzb2gcr
https://github.com/rogerjdeangelis/utl-transposing-mutiple-sets-of-related-variables/new/master

SAS Forum
https://tinyurl.com/ugg328b
https://communities.sas.com/t5/SAS-Programming/How-do-I-generate-a-variable-for-each-observation-of-each-ID/m-p/610451

macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;


data have;
      informat Startdate Enddate $11.;
      input ID Startdate Enddate;
      cards;
1 01/01/2001 31/12/2001
1 01/01/2002 04/05/2002
1 06/07/2002 30/11/2002
2 05/05/2001 05/06/2001
2 07/07/2001 15/10/2001
3 01/04/2002 08/09/2003
;
run;

WORK.HAVE total obs=6

Obs    STARTDATE      ENDDATE      ID

 1     01/01/2001    31/12/2001     1
 2     01/01/2002    04/05/2002     1
 3     06/07/2002    30/11/2002     1
 4     05/05/2001    05/06/2001     2
 5     07/07/2001    15/10/2001     2
 6     01/04/2002    08/09/2003     3


*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;

WORK.WANT total obs=3

 ID  STARTDATE1   ENDDATE1   STARTDATE2   ENDDATE2   STARTDATE3   ENDDATE3

  1  01/01/2001  31/12/2001  01/01/2002  04/05/2002  06/07/2002  30/11/2002
  2  05/05/2001  05/06/2001  07/07/2001  15/10/2001
  3  01/04/2002  08/09/2003


*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utl_transpose(data=have, out=want, by=id,var=startdate enddate)


