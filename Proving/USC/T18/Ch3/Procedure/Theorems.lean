import Proving.USC.T18.Ch3.Procedure.Statute








namespace Proving.USC.T18.Ch3.Procedure



theorem penaltyTrigger_intro {p c}
    (hV : ViolationOccurred p c) (hP : ProsecutionCommenced p c)
    (hC : ConvictionEntered p c) : PenaltyTrigger p c :=
  ⟨hV, hP, hC⟩



theorem restitutionAvailable_intro {p c}
    (hC : ConvictionEntered p c) (hR : RestitutionOrderEntered p c) :
    RestitutionAvailable p c :=
  ⟨hC, hR⟩



theorem timelyPromulgation_intro {c}
    (hI : PromulgationIssued c) (hW : PromulgationWithin180Days c) :
    TimelyPromulgation c :=
  ⟨hI, hW⟩

end Proving.USC.T18.Ch3.Procedure
