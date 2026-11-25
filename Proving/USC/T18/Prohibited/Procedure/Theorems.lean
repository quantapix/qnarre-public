












import Proving.USC.T18.Prohibited.Procedure.Types
import Proving.USC.T18.Prohibited.Procedure.Predicates
import Proving.USC.T18.Prohibited.Procedure.Doctrine
import Proving.USC.T18.Prohibited.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Procedure

open Proving.USC.Common




theorem timelyFiling_intro {t p c}
    (hAcc : ClaimAccrued p c) (hPred : ViolationPredicated t p c)
    (hFiled : ComplaintFiled p c) (hWin : WithinFourYearWindow p c) :
    TimelyFiling t p c :=
  ⟨hAcc, hPred, hFiled, hWin⟩

@[grind →]
theorem procedurallyTimely_introA {p c} (h : TimelyFiling ViolationTarget.subA p c) :
    ProcedurallyTimely p c := ProcedurallyTimely.viaA h

@[grind →]
theorem procedurallyTimely_introB {p c} (h : TimelyFiling ViolationTarget.subB p c) :
    ProcedurallyTimely p c := ProcedurallyTimely.viaB h

@[grind →]
theorem procedurallyTimely_introC {p c} (h : TimelyFiling ViolationTarget.subC p c) :
    ProcedurallyTimely p c := ProcedurallyTimely.viaC h

@[grind →]
theorem procedurallyTimely_introD {p c} (h : TimelyFiling ViolationTarget.subD p c) :
    ProcedurallyTimely p c := ProcedurallyTimely.viaD h

end Proving.USC.T18.Prohibited.Procedure
