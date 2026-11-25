









import Proving.USC.T18.Ch1.Ontology.Statute

namespace Proving.USC.T18.Ch1.Ontology

open Proving.USC.Common







def isPrincipal_intro {p c} (route : PrincipalRoute) (h : IsPrincipal p c)
    : PrincipalMembership p c := ⟨route, h⟩


def isSpecialMaritimeTerritorialJurisdiction_intro {pl c}
    (case : SMTJCase) (h : IsSpecialMaritimeTerritorialJurisdiction pl c)
    : SMTJMembership pl c := ⟨case, h⟩



def isVesselOfUnitedStates_intro {v c}
    (ownership : VesselOfUSOwnership) (h : IsVesselOfUnitedStates v c)
    : VesselOfUSMembership v c := ⟨ownership, h⟩


def isPostalService_intro {e c}
    (kind : PostalServiceMember) (h : IsPostalService e c)
    : PostalServiceMembership e c := ⟨kind, h⟩


def isMinor_intro {p c} (age : Nat) (hAge : age < 18) (h : IsMinor p c)
    : MinorDef p c := ⟨age, hAge, h⟩




theorem minorAge_17_isUnder18 : (17 : Nat) < 18 := by decide


theorem minorAge_18_notUnder18 : ¬ ((18 : Nat) < 18) := by decide

end Proving.USC.T18.Ch1.Ontology
