import { BadRequestException, Injectable, Logger } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AssortmentLogType, CustomFieldValue, Prisma, Product, ProductPrice } from '@prisma/client';

const include: Prisma.ProductInclude = {
  prices: true,
  fields: { include: { customEntityValue: { include: { customEntity: true } }, customField: true } },
  logs: { include: { user: true } },
}
@Injectable()
export class CatalogService {
  logger = new Logger(CatalogService.name);

  constructor(private prisma: PrismaService) {}

  findMinimalInfo() {
    return this.prisma.product.findMany({
      orderBy: { name: 'asc' },
      select: { name: true, article: true, id: true },
    });
  }
}
