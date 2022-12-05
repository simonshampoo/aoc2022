import collections

f = open("input.txt", "r")
ans = 0
top_3 = collections.defaultdict()
minis = []
i = 0
for l in f:
    if l != "\n":
        minis.append(int(l))
    else:
        ans = max(ans, sum(minis))
        top_3[i] = sum(minis)
        minis = []
        i += 1


print(ans)
a = [i[1] for i in top_3.items()]
a.sort()
print(sum(a[-3:]))
# print(sorted(top_3.items(), key=lambda kv: kv[1])[-3:])

