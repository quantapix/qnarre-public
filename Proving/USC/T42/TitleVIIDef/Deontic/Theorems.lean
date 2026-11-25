







import Proving.USC.T42.TitleVIIDef.Deontic.Types
import Proving.USC.T42.TitleVIIDef.Deontic.Predicates
import Proving.USC.T42.TitleVIIDef.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Deontic

open Proving.USC.Common


theorem definitionBlock_intro {p c}
    (hEmp : IsCoveredEmployer p c) (hResp : IsRespondent p c) :
    DefinitionBlock p c :=
  { coveredEmployer := hEmp, respondent := hResp }


theorem prohibition2000e2a_violated_intro {p g c}
    (hAddr : AddresseeEmployer p c) (hCond : BecauseOfProtectedGround p g c)
    (hAct : DiscriminatoryActOccurred p c) (hNoExc : ¬ ExceptionApplies p c) :
    Prohibition2000e2aViolated p g c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoExc⟩


theorem prohibition2000e2b_violated_intro {p g c}
    (hAddr : AddresseeEmploymentAgency p c) (hCond : BecauseOfProtectedGround p g c)
    (hAct : DiscriminatoryActOccurred p c) (hNoExc : ¬ ExceptionApplies p c) :
    Prohibition2000e2bViolated p g c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoExc⟩


theorem prohibition2000e2c_violated_intro {p g c}
    (hAddr : AddresseeLaborOrganization p c) (hCond : BecauseOfProtectedGround p g c)
    (hAct : DiscriminatoryActOccurred p c) (hNoExc : ¬ ExceptionApplies p c) :
    Prohibition2000e2cViolated p g c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoExc⟩


theorem prohibition2000e2d_violated_intro {p g c}
    (hAddr : AddresseeTrainingController p c) (hCond : BecauseOfProtectedGround p g c)
    (hAct : DiscriminatoryActOccurred p c) (hNoExc : ¬ ExceptionApplies p c) :
    Prohibition2000e2dViolated p g c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoExc⟩


theorem prohibition2000e2k_violated_intro {p c}
    (hAddr : IsRespondent p c) (hImpact : CausesUnjustifiedDisparateImpact p c) :
    Prohibition2000e2kViolated p c :=
  ⟨⟨hAddr⟩, hImpact⟩


theorem prohibition2000e2l_violated_intro {p c}
    (hAddr : IsRespondent p c) (hAlter : AlteredTestScoresOnProtectedGround p c) :
    Prohibition2000e2lViolated p c :=
  ⟨⟨hAddr⟩, hAlter⟩


theorem prohibition2000e2m_violated_intro {p c}
    (hAddr : IsRespondent p c) (hMot : ProtectedGroundWasMotivatingFactor p c) :
    Prohibition2000e2mViolated p c :=
  ⟨⟨hAddr⟩, hMot⟩


theorem prohibition2000e3a_violated_intro {p c}
    (hAddr : AddresseeRetaliation p c) (hCond : ProtectedActivityOccurred p c)
    (hAct : RetaliatoryActOccurred p c) :
    Prohibition2000e3aViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2000e3b_violated_intro {p c}
    (hAddr : AddresseeRetaliation p c) (hAd : PublishedDiscriminatoryAdvertisement p c) :
    Prohibition2000e3bViolated p c :=
  ⟨⟨hAddr⟩, hAd⟩


theorem titleVIINormViolated_via_employer_intro {p g c}
    (h : Prohibition2000e2aViolated p g c) : TitleVIINormViolated p c :=
  .viaEmployer g h

end Proving.USC.T42.TitleVIIDef.Deontic
