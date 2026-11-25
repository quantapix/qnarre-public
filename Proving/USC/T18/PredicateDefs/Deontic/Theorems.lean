






import Proving.USC.T18.PredicateDefs.Deontic.Types
import Proving.USC.T18.PredicateDefs.Deontic.Predicates
import Proving.USC.T18.PredicateDefs.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Deontic

open Proving.USC.Common



theorem financialInstitutionApplies20_intro {o c}
    (hMod : ClauseHasModality Modality.Definition c)
    (hFi : IsFinancialInstitution o c) :
    FinancialInstitutionApplies20 o c :=
  ⟨⟨hMod⟩, hFi⟩


theorem schemeToDefraudApplies1346_intro {p c}
    (hMod : ClauseHasModality Modality.Definition c)
    (hScheme : DevisedSchemeToDefraud p c) :
    SchemeToDefraudApplies1346 p c :=
  ⟨⟨hMod⟩, hScheme⟩



theorem honestServicesApplies1346_intro {p c}
    (hScheme : SchemeToDefraudApplies1346 p c)
    (hHS : DeprivesHonestServices p c) :
    HonestServicesApplies1346 p c :=
  ⟨hScheme, hHS⟩


theorem officialProceedingApplies1515a_intro {o c}
    (hMod : ClauseHasModality Modality.Definition c)
    (hProc : IsOfficialProceeding o c) :
    OfficialProceedingApplies1515a o c :=
  ⟨hMod, hProc⟩



theorem permissionExercised1515c_intro {p c}
    (hMod : ClauseHasModality Modality.Permission c)
    (hCond : RepresentationLawfulBonaFide p c)
    (hAct : ProvidedRepresentationServices p c) :
    PermissionExercised1515c p c :=
  ⟨⟨hMod, hCond⟩, hAct⟩

end Proving.USC.T18.PredicateDefs.Deontic
