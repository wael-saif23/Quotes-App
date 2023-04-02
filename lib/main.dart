import 'package:flutter/material.dart';
import 'package:quotes_app/add_new_quotes.dart';
import 'package:quotes_app/quotes_items.dart';
import 'package:quotes_app/quotes_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  //the list of quotes that i work with
  List<QuotesModel> quotes = [
    QuotesModel(
        auther: "هيرام سميث",
        quote:
            "إن السر في النجاح والسعادة هو أن تترجم قيمك إلى مواقف الحياة اليومية."),
    QuotesModel(
        auther: "الامام جعفر الصادق",
        quote:
            "للمرائي ثلاث علامات : يكسل إذا كان وحده، وينشط إذا كان عنده الناس، ويحب أن يحمد بما لم يفعل."),
    QuotesModel(
        auther: " بات رايلي ",
        quote:
            " التميز هي النتيجة التى يتوصل اليها تدريجيا بعد الكفاح الدائم من اجل التحسن"),
    QuotesModel(
        auther: "ادهم شرقاوي",
        quote:
            "  إذا أردت تغيير العالم ؛ فافعل ذلك قبل الزواج ؛ لأنك بعد الزواج إذا استطعت تغيير قناة التلفزيون ؛ فأنت بطل"),
  ];
//that function to delet the quote - passed to icon bottom in quotes item
  deletQuotes(index) {
    setState(() {
      quotes.remove(quotes[index]);
    });
  }
//that function to add new the quote - passed to text bottom in add quotes
  addQuote() {
    setState(() {
      quotes.add(
        QuotesModel(auther: controlerList[0].text, quote: controlerList[1].text),
      );
    });
  }
//list of controler to catch the text in text field 
  List<TextEditingController> controlerList = [
    TextEditingController(),
    TextEditingController(),
  ];
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddNewQuotes(
        myAutherControl: controlerList[0],
        myQutoesControl: controlerList[1],
        addQuote: addQuote,
        auther: controlerList[0].text,
        quote: controlerList[1].text,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 182),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (BuildContext context, int index) {
                return QuotesItem(
                  auther: quotes[index].auther,
                  quote: quotes[index].quote,
                  delet: deletQuotes,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
