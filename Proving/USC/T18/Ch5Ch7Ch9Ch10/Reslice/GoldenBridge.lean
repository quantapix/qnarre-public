
























































































































import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Elements.Statute
import Proving.Rico.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.GoldenBridge

open Proving.USC.Common









axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText


axiom chargedAct : Person → ComplaintText → Proving.Rico.Act









axiom corr_s152_racketeering (d : Person) (pr : Elements.EstateProperty)
    (doc : Elements.RecordedInformation) (cl : Elements.ProofOfClaim)
    (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.Section152 d pr doc cl bc c →
    Elements.InOrInRelationToTitle11Case bc c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s152_elements_implies_golden (d : Person) (pr : Elements.EstateProperty)
    (doc : Elements.RecordedInformation) (cl : Elements.ProofOfClaim)
    (bc : Elements.BankruptcyCase) (c : ComplaintText)
    (hNexus : Elements.InOrInRelationToTitle11Case bc c) :
    Elements.Section152 d pr doc cl bc c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s152_racketeering d pr doc cl bc c h hNexus








axiom corr_s153_racketeering (d dbtr : Person) (pr : Elements.EstateProperty)
    (doc : Elements.RecordedInformation) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) :
    Elements.Section153 d pr doc c →
    Elements.Section151Debtor dbtr bc c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s153_elements_implies_golden (d dbtr : Person) (pr : Elements.EstateProperty)
    (doc : Elements.RecordedInformation) (bc : Elements.BankruptcyCase)
    (c : ComplaintText) (hDebtor : Elements.Section151Debtor dbtr bc c) :
    Elements.Section153 d pr doc c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s153_racketeering d dbtr pr doc bc c h hDebtor









axiom corr_s155_racketeering (d : Person) (ag : Agreement)
    (bc : Elements.BankruptcyCase) (c : ComplaintText) :
    Elements.Section155 d ag c →
    Elements.InOrInRelationToTitle11Case bc c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s155_elements_implies_golden (d : Person) (ag : Agreement)
    (bc : Elements.BankruptcyCase) (c : ComplaintText)
    (hNexus : Elements.InOrInRelationToTitle11Case bc c) :
    Elements.Section155 d ag c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s155_racketeering d ag bc c h hNexus
















axiom corr_s175_subsecA_racketeering (d : Person) (m : Elements.BioMaterial) (org : Entity)
    (c : ComplaintText) :
    Elements.Section175ProhibitedUse d m org c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s175_subsecA_elements_implies_golden (d : Person) (m : Elements.BioMaterial)
    (org : Entity) (c : ComplaintText) :
    Elements.Section175ProhibitedUse d m org c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s175_subsecA_racketeering d m org c h


axiom corr_s175_subsecB_racketeering (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175UnjustifiedPossession d m c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s175_subsecB_elements_implies_golden (d : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175UnjustifiedPossession d m c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s175_subsecB_racketeering d m c h






axiom corr_s175b_racketeering (d tr : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175b d tr m c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s175b_elements_implies_golden (d tr : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175b d tr m c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s175b_racketeering d tr m c h






axiom corr_s175c_racketeering (d v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175c d v m c →
    Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c)


theorem s175c_elements_implies_golden (d v : Person) (m : Elements.BioMaterial)
    (c : ComplaintText) :
    Elements.Section175c d v m c →
      Proving.Rico.IsRacketeeringActivity (chargedAct d c) (mapComplaint c) :=
  fun h => corr_s175c_racketeering d v m c h

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.GoldenBridge
