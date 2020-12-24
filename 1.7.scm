; Exercise 1.7: The good-enough? test used in computing square roots will not
; be very effective for finding the square roots of very small numbers. Also,
; in real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for small
; and large numbers. An alternative strategy for implementing good-enough? is
; to watch how guess changes from one iteration to the next and to stop when
; the change is a very small fraction of the guess. Design a square-root
; procedure that uses this kind of end test. Does this work better for small
; and large numbers?

; Answer

(define (average x y)
  (/ (+ x y) 2))


(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x) x)))

; (sqrt-iter 1 0.00000000001)
; Value 0.0312500001065625 This is more like the sqrt of 0.001

; (sqrt-iter 1 10000) ; Value 1330628307561186334660367868328865271376707523982633184151969563348981313968515235922430804520677463939600810331518347476015389674601660562117954782079216446145588853129996868117135788665369771551015971995847471035645650522544903941562762096754456084007052684858866517379443805865759537444122906632520465350937021122257595465168175856812965579228372304214774232630005922612971418808817716680737966407653604074342342665876197231705477095962263699446872260467007968562107644888795047573386912532515987122961711615663843975967049537045090282980843972620803023340716308350646329944265725034559931239041762539093386365206227964177762545989732392701009354889087985457635350254663444656908649901876189091097995244471739264282425837499625682089284258430645800397377722600169944748886852245178024555916273483066732705149745381595284965099452882515056863800877972176189892177070809405268302378969745113911247121046408793066378458601258509910441951257107397382034552440185956401373594619507569403808069571481791958170385451313435483067866016737706988941394763560829908665952710081130310322125872007064253790505130448398861485779905121604392903030302601517151812221539548809332895947527020596042081466562736468011563642111064598307802421266983396686520065786263004151452390036712764415075754837401330204415190180986776984213530759069782921978309553261555313677729254216191175334783731164573303296793727545596965986095366587394914939599411351932940923989153244763699587257752344152099565090614764757128117465176096911857112897023346792748816151911374363042146710964239022176271565704005900773107874734069392693633422735975507753566392981868400442205585545827175799898837282476872645551498515695240413262693172944912260327913724092043517191747174837788231507259854547795698656501130138213686890245042898700008056158177926403819584742782601804181070188526203112664079143940363511619807214399557408909502198725170227199577677569484397247318477000991094468926793178128738653795891116855151255456410180889958711558165093592842509634075850274089759716941275398942837760001/13306283041693157944669238363999385692716576295160880739456095590691695970271639642654421602024725217462761478292520742071311777023453813737422735845668758595810661611743230346430327169918717994561059900762453713771435766872683986816551959929445628928842143460192113864721027451047803942052913447945122253491855038419936352676085117222667590404421652535809826292472460211635809405484465614277021614964970163033038636420140810997611108191476682638078979372592953525430917092039420436098029542492132457960183872217061941780843977266007140566447617575286008423410087911959284288875803534821882931506612429935162686584350334118641064644022433168826987566775270823219295799362332453818949167594684850698053563935801268362606380486623046220265423134935295858282745619431922224548651688996905693813653367557291604405446742517203952096728615336511053134528183300335157215744154990519158462850455382886335900127167405570583374961529580684456973268219740961970608457993341878479934344322315154001801735466332836317086177511865476346724390135863352084118650326079790933423901879562506947898989256410094307559444457176380306600297521555868601361937169704726132749011712325885928793396471071104484103476555156220154092220289863035057700776235735390312855117194043255193646520051798573241641708063994026094114154327919340718601756968400524539892751138549121861548335807207096666310651992320188899564698128317424183984615901769364750592795892689148837082751308620929821965430059941189994596922742784157383459016530037759998079428450741595658141474475589614443257856520434635936269870810981849777397773601976490379793485956775617297507048886241424574495084154081782360440126573764613140447474305644818756416523747823760498991407274143748016260232226048019424082779854392067291142223383736106699416169119861428457804344779915424052942826436381418861115374683581245503739115696242270295113128198138104750537168349818690301635714808669603792162904569571652812723363744899904839548775109119699824784027378201400862624841963509288549492641816806612840990528905054730241024 

; Yeah that's a big "meatball"

; Adding a new-good-enough?

(define (new-good-enough? guess x)
  (< (abs (/ (- guess (improve guess x)) guess)) 0.001))

; we compare this guess with how it will be improved... if the change is more
; than 0.1 percent, it will continue. This improved the small value and the
; large one in the following way.

(define (sqrt-iter guess x)
  (if (new-good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

; (sqrt-iter 1 0.00000000001) ; Value 3.162288643712707e-6

; (sqrt-iter 1 10000) ; Value 815697038176959424712547125308055439029452941288827103326838836661721818168457267005873310804221798243404324039591576239369292157239855851646502515432438643320280324472363915167291818704791278699096231303966035974145018337583747082263096938102466558356003519022716404779070679254150054130743097478837114913476953874065085192615115349013096972647276249853866538766584473880049929345679993450810982391732010304091428010028049133328959740210658328677750617502211088242741600134970383215281537812033770782841910555815318527748357638598202157954835119960124905001568911507715266237172344300149837179625289564883495639572195732122109453562238894062352907808342114077884637225007375330136807699690973755862241431697611675233323055345004968424261329011886390664397818278141670526742042448429666047385745575340579214316162669244498867937843150310614845039717979543966560871071761433940815755071359539630570805163788553243441478864956483855229269364730149661186230855068342156215718624839995640137484691990857844964152533611713308160001/8156387984092727877402489824001747775320891841864249127948880450761178314454697273971099232918596136517170550665703328439427915149343021411320848290081833695089504627500953054861463466639230940208473644685673957951826695569275114919900937046748308330682205516797358318572231901001573572560015967254537880606693144462803965958357381027368149931110077910387838372347396609050597618233791692973196812162386445124731250069369568894878917012507790232525869813133406515840330593830878636876132489183026755558727616333429337898117274286737646326940737484274604223090520215597312967954876973015530375095801360073898505580741117221241604587643446465642995036976253157594485721264001133068594702192374178064101964791450865039531384408225063643256750003233681164989994252896625521721784183382247920895031892818314488544982952753557289974393916982151319388335390030722612785408274360548431818448453970439065667853126345345926114514887109165465383922503014988299006080983612659859002376454322707687093854362778306576577610943761587200512

; This number was coerced into a float by multiplying by 1.0 and returned 100.00714038711746
; the other value was too big and didn't return anything :P

; (* 1.0 (/ 815697038176959424712547125308055439029452941288827103326838836661721818168457267005873310804221798243404324039591576239369292157239855851646502515432438643320280324472363915167291818704791278699096231303966035974145018337583747082263096938102466558356003519022716404779070679254150054130743097478837114913476953874065085192615115349013096972647276249853866538766584473880049929345679993450810982391732010304091428010028049133328959740210658328677750617502211088242741600134970383215281537812033770782841910555815318527748357638598202157954835119960124905001568911507715266237172344300149837179625289564883495639572195732122109453562238894062352907808342114077884637225007375330136807699690973755862241431697611675233323055345004968424261329011886390664397818278141670526742042448429666047385745575340579214316162669244498867937843150310614845039717979543966560871071761433940815755071359539630570805163788553243441478864956483855229269364730149661186230855068342156215718624839995640137484691990857844964152533611713308160001 8156387984092727877402489824001747775320891841864249127948880450761178314454697273971099232918596136517170550665703328439427915149343021411320848290081833695089504627500953054861463466639230940208473644685673957951826695569275114919900937046748308330682205516797358318572231901001573572560015967254537880606693144462803965958357381027368149931110077910387838372347396609050597618233791692973196812162386445124731250069369568894878917012507790232525869813133406515840330593830878636876132489183026755558727616333429337898117274286737646326940737484274604223090520215597312967954876973015530375095801360073898505580741117221241604587643446465642995036976253157594485721264001133068594702192374178064101964791450865039531384408225063643256750003233681164989994252896625521721784183382247920895031892818314488544982952753557289974393916982151319388335390030722612785408274360548431818448453970439065667853126345345926114514887109165465383922503014988299006080983612659859002376454322707687093854362778306576577610943761587200512))