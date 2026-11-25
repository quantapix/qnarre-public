













import Proving.USC.T42.CRIPA.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.CRIPA.Elements

open Proving.USC.Common








axiom IsCoveredInstitution (i : Institution) (c : ComplaintText) : Prop




axiom AGHasReasonableCause (i : Institution) (c : ComplaintText) : Prop




axiom SubjectedToEgregiousConditions (i : Institution) (c : ComplaintText) : Prop







axiom DeprivesFederalRightsGrievousHarm (i : Institution) (c : ComplaintText) : Prop





axiom PatternOrPracticeOfResistance (i : Institution) (c : ComplaintText) : Prop





axiom SeeksMinimumCorrectiveRelief (i : Institution) (c : ComplaintText) : Prop




axiom AGPersonallySignedComplaint (p : Person) (c : ComplaintText) : Prop







axiom Gave49DayWrittenNotice (cert : Certification) (c : ComplaintText) : Prop





axiom MadeGoodFaithConciliationEffort (cert : Certification) (c : ComplaintText) : Prop




axiom AffordedReasonableTimeToCorrect (cert : Certification) (c : ComplaintText) : Prop




axiom CertifiedGeneralPublicImportance (cert : Certification) (c : ComplaintText) : Prop




axiom AGPersonallySignedCertification (p : Person) (cert : Certification) (c : ComplaintText) : Prop







axiom PendingActionCommenced (i : Institution) (c : ComplaintText) : Prop





axiom InterventionTimingSatisfied (c : ComplaintText) : Prop






axiom ReportedConditions (p : Person) (c : ComplaintText) : Prop




axiom SubjectedToRetaliation (p : Person) (c : ComplaintText) : Prop







axiom IsPrisoner (p : Person) (c : ComplaintText) : Prop






axiom ExhaustedAdministrativeRemedies (p : Person) (c : ComplaintText) : Prop





axiom PriorPhysicalInjuryShowing (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.CRIPA.Elements
