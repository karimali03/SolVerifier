#define _CRT_SECURE_NO_WARNINGS
#include "../lib/testlib.h"
#include <bits/stdc++.h>
#include <unordered_map>
#define endl "\n"
#define all(v) v.begin(),v.end()
#define rt(s) return cout<<s,0
#define sz(s)	(int)(s.size())
#define OO 0x3f3f3f3f3f3f3f3fLL
#define oo 0x3f3f3f3f
using namespace std;
typedef long long ll;
int dx[] { -1, 0, 0, 1, 1, 1, -1, -1 };
int dy[] { 0, -1, 1, 0, 1, -1, 1, -1 };
 
 
const int N = 1e6 + 4;
const ll INF = 1LL << 60;



int main(int argc, char** argv) {
    registerGen(argc, argv, 1);
    int x = rnd.next(1 , 100);
    cout << x << endl;
    return 0;
}
