













import Proving.TitleIIEnf.Types

namespace Proving.TitleIIEnf





axiom PendingEnforcementProceeding (pr : Proceeding) (c : ComplaintText) : Prop





axiom AGRequestedThreeJudgeCourt (pr : Proceeding) (c : ComplaintText) : Prop




axiom AccompaniedByPublicImportanceCertificate (pr : Proceeding) (c : ComplaintText) : Prop







axiom RequestFurnishedToChiefJudge (pr : Proceeding) (c : ComplaintText) : Prop



axiom ThreeJudgesDesignated (d : Designation) (pr : Proceeding) (c : ComplaintText) : Prop




axiom PanelCompositionProper (d : Designation) (c : ComplaintText) : Prop








axiom CaseExpeditedAtEarliestDate (pr : Proceeding) (c : ComplaintText) : Prop





axiom AppealLiesToSupremeCourt (pr : Proceeding) (c : ComplaintText) : Prop





axiom AGDidNotRequestThreeJudgeCourt (pr : Proceeding) (c : ComplaintText) : Prop






axiom DistrictChiefDesignatedSingleJudge (d : Designation) (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.TitleIIEnf
