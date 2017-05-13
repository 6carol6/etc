#include <map>
#include <fstream>
#include <iostream>
#include <algorithm>
using namespace std;

struct Time{
  int h, m, s;
  bool operator==(const Time& t) const {
    return (this->h == t.h) && (this->m == t.m) && (this->s == t.s);
  }
  bool operator<(const Time& t) const {
    if(this->h == t.h){
      if(this->m == t.m) return this->s < t.s;
      return this->m < t.m;  
    }
    return this->h < t.h;
  }
}ts[1000], te[1000];

int timeToSecond(const Time& t){
  return t.h*3600 + t.m*60 + t.s;  
}

bool cmp(const Time& a, const Time& b){
  if(a.h == b.h){
    if(a.m == b.m) return a.s < b.s;
    return a.m < b.m;
  }
  return a.h < b.h;
}

int cnt;
map<Time, int> taskNum;

void input(const char* file, Time t[1000]){
  ifstream infile(file, ios::in);
  cnt = 0;
  char c;
  while (infile >> t[cnt].h >> c >> t[cnt].m >> c >> t[cnt].s){
    cnt++;
  }
  sort(ts, ts+cnt, cmp);

//  for(int i = 0; i < cnt; i++){
//    cout << t[i].h << " " << t[i].m << " "  << t[i].s << endl;  
//  }
  infile.close();
}

void teAdd(){
  for(int i = 0; i < cnt; i++){
      if(te[i].s == 59){
        if(te[i].m == 59){
          te[i].h++; te[i].m=0; te[i].s=0;
          continue;
        }
        te[i].m++; te[i].s=0;
        continue;
      }
      te[i].s++;
  }
}

void work(){
  for(int i = 0; i < cnt; i++){
      taskNum[ts[i]]++;
      taskNum[te[i]]--;
  }

  map<Time, int>::iterator it = taskNum.begin();
  map<Time, int>::iterator it1 = it;
  it++;
  while(it != taskNum.end()){
    it->second += it1->second;
    it++; it1++;
  }

  // do with negatives
  it = taskNum.begin();
  while(it != taskNum.end()){
    if(it->second < 0){
      cout << "error"<<endl;
       taskNum[it->first] = 0;
    }
    it++;
  }
  //cout << taskNum.size() << endl;
  
  it = taskNum.begin();
  int begin = timeToSecond(it->first);

  while(it != taskNum.end()){
    int now = timeToSecond(it->first) - begin;
    cout << now << " " << it->second << endl;  
    it++;
  }
}

int main(){
  input("start", ts);
  input("end", te);
  teAdd();
  taskNum.clear();
  work();
  return 0;  
}
