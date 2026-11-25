






import Proving.USC.T09.Deontic.Statute

namespace Proving.USC.T09.Deontic

open Proving.USC.Common



theorem enforceabilityConferred2_intro {a c}
    (hAgr : IsWrittenArbitrationAgreement a c)
    (hNoRev : ¬ RevocationGroundExists a c) :
    EnforceabilityConferred2 a c :=
  ⟨⟨hAgr⟩, hNoRev⟩



theorem stayObligationBreached3_intro {a p pr c}
    (hAgr : IsWrittenArbitrationAgreement a c)
    (hRef : IssueReferableToArbitration a pr c)
    (hApp : PartyAppliedForRelief p c)
    (hNotDef : ApplicantNotInDefault p c)
    (hNoOrder : ¬ CourtEnteredOrder pr c) :
    StayObligationBreached3 a p pr c :=
  ⟨⟨hAgr, hRef, hApp, hNotDef⟩, hNoOrder⟩



theorem compelObligationBreached4_intro {p a pr c}
    (hAgr : IsWrittenArbitrationAgreement a c)
    (hFail : FailureToArbitrate p a c)
    (hPet : PartyAppliedForRelief p c)
    (hNotIssue : MakingNotInIssue a c)
    (hNoOrder : ¬ CourtEnteredOrder pr c) :
    CompelObligationBreached4 p a pr c :=
  ⟨⟨hAgr, hFail, hPet, hNotIssue⟩, hNoOrder⟩



theorem confirmObligationBreached9_intro {w p pr c}
    (hApp : PartyAppliedForRelief p c)
    (hTimely : AwardConfirmationTimely w c)
    (hNoGround : NoGroundToRefuseConfirmation w c)
    (hNoOrder : ¬ CourtEnteredOrder pr c) :
    ConfirmObligationBreached9 w p pr c :=
  ⟨⟨hApp, hTimely, hNoGround⟩, hNoOrder⟩




theorem invalidityProhibitionViolated402_intro {a p c}
    (hPre : IsPredisputeArbitrationAgreement a c)
    (hElect : SexualMisconductDisputeElected p c)
    (hEnf : EnforcementSought a c) :
    InvalidityProhibitionViolated402 a p c :=
  ⟨⟨hPre, hElect⟩, hEnf⟩



theorem appointmentPower5_intro {a court c}
    (hAgr : IsWrittenArbitrationAgreement a c) :
    AppointmentPower5 a court c :=
  ⟨hAgr⟩

end Proving.USC.T09.Deontic
