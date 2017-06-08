 put 'person/:person_trust', 
 to: 'dashboards#person_trust', 
 as: :person_trust, 
 constraints: { person_trust: /trusted|untrusted|unmark/ }
