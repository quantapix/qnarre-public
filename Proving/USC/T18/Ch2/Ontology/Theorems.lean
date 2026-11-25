







import Proving.USC.T18.Ch2.Ontology.Types
import Proving.USC.T18.Ch2.Ontology.Predicates
import Proving.USC.T18.Ch2.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch2.Ontology

open Proving.USC.Common



theorem motorVehicleMembership_intro {v u c}
    (hBase : IsMotorVehicle v c) (hCommercial : IsUsedForCommercialPurposes u c)
    : MotorVehicleMembership v u c := ⟨hBase, hCommercial⟩



theorem inServiceMembership_intro {a c}
    (hInService : IsInService a c) (hInFlight : IsInFlight a c)
    : InServiceMembership a c := ⟨hInService, hInFlight⟩



theorem aviationQualityMembership_intro {p c}
    (hPart : IsPart p c) (hQuality : IsAviationQuality p c)
    : AviationQualityMembership p c := ⟨hPart, hQuality⟩



theorem nonqualifyingUserMembership_intro {p t c}
    (hUser : IsNonqualifyingUser p c)
    (hTransmitter : IsTrafficSignalPreemptionTransmitter t c)
    : NonqualifyingUserMembership p t c := ⟨hUser, hTransmitter⟩



theorem wildfireSuppressionMembership_intro {s w c}
    (hSuppression : IsWildfireSuppression s c) (hWildfire : IsWildfire w c)
    : WildfireSuppressionMembership s w c := ⟨hSuppression, hWildfire⟩


theorem majorDrugOffense_intro_cce {o c}
    (h : IsContinuingCriminalEnterprise o c) : MajorDrugOffenseDef o c :=
  .cce h


theorem majorDrugOffense_intro_conspiracy {o c}
    (h : IsDrugConspiracyOffense o c) : MajorDrugOffenseDef o c :=
  .conspiracy h


theorem majorDrugOffense_intro_majorQuantity {o c}
    (h : IsMajorQuantityDrugOffense o c) : MajorDrugOffenseDef o c :=
  .majorQuantity h

end Proving.USC.T18.Ch2.Ontology
