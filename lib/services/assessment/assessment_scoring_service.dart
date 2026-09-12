import '../../data/models/question_model.dart';
class AssessmentScoringService { Map<String,num> score(List<QuestionModel> questions,Map<String,String> answers) { final totals=<String,num>{}; for(final question in questions){ final id=answers[question.id]; final option=question.options.where((o)=>o.id==id).firstOrNull; if(option!=null){ option.scores.forEach((key,value)=>totals[key]=(totals[key]??0)+value); } } return totals; } }
extension _FirstOrNull<T> on Iterable<T> { T? get firstOrNull=>isEmpty?null:first; }
